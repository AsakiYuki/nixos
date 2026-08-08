import { spawn, SpawnOptionsWithoutStdio } from "child_process"

export async function spawnStdout(
	command: string,
	args: string[] = [],
	options?: SpawnOptionsWithoutStdio,
): Promise<string> {
	return new Promise((resolve, reject) => {
		const spw = spawn(command, args, options)

		spw.stdout.setEncoding("utf8")
		spw.stderr.setEncoding("utf8")

		const stdout: string[] = []
		const stderr: string[] = []

		spw.stdout.on("data", chunk => stdout.push(chunk))
		spw.stderr.on("data", chunk => stderr.push(chunk))
		spw.on("error", reject)

		spw.on("close", code => {
			if (code === 0) resolve(stdout.join("").trim())
			else reject(new Error(`Command "${command} ${args.join(" ")}" exited with code ${code}: ${stderr.join("")}`))
		})
	})
}
