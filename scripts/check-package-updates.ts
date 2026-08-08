import path from "path"
import fs from "fs/promises"

import { getGithubRepoLatestRelease } from "./helpers/github"
import { fetchZipHash } from "./helpers/nix"

let packages: any = {}

async function fetchLastBunBaselinePackage() {
	const packageName = "bun-baseline"
	const cached = packages[packageName]

	console.info(`[INFO] Checking latest release for ${packageName}...`)

	const latestRelease = await getGithubRepoLatestRelease("oven-sh", "bun")
	if (!latestRelease) {
		console.warn(`[WARN] Could not fetch latest release for ${packageName}.`)
		return null
	}

	const newVersion = latestRelease.tag_name.split("v")[1]

	if (cached && cached.version === newVersion) {
		console.info(`[SKIP] ${packageName} is already up to date (v${newVersion}).`)
		return
	}

	console.info(`[UPDATE] New version found for ${packageName}: v${cached?.version || "none"} -> v${newVersion}`)

	const file = latestRelease.assets.find(({ name }) => name === "bun-linux-x64-baseline.zip")
	if (!file) {
		console.warn(`[WARN] Asset 'bun-linux-x64-baseline.zip' not found in release v${newVersion}.`)
		return null
	}

	console.info(`[INFO] Fetching zip hash from: ${file.download_url}`)
	const hash = await fetchZipHash(file.download_url)

	packages[packageName] = { version: newVersion, hash }
	console.info(`[SUCCESS] Updated ${packageName} to v${newVersion} with hash: ${hash}`)
}

async function main() {
	packages = JSON.parse(await fs.readFile(path.join(__dirname, "../../assets/packages.json"), "utf-8"))

	await Promise.all([fetchLastBunBaselinePackage()])

	await fs.writeFile(path.join(__dirname, "../../assets/packages.json"), JSON.stringify(packages, null, 4))
	// if (!test) return
	// console.log(test)
	// fetchZipHash(test.assets[0].download_url).then(console.log)
}

main()
