import { spawnStdout } from "./shell"

export async function fetchZipHash(file_url: string): Promise<string> {
	const nix32Hash = await spawnStdout("nix-prefetch-url", ["--unpack", file_url])
	return spawnStdout("nix", ["hash", "convert", "--hash-algo", "sha256", "--from", "nix32", nix32Hash])
}
