cask "coprem" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.9"
  sha256 arm:   "ff1cf1b7864c4bbe982756c292e4a6dd09ebbfdfda0c097a679101fdb81b5b60",
         intel: "50d8e7c1fb4d99b369ce797a4a5b1f6a0760dcb74fea2f8ff71981f279380553"

  url "https://github.com/bariiss/coprem/releases/download/v#{version}/coprem_#{version}_darwin_#{arch}.tar.gz",
      verified: "github.com/bariiss/coprem/"
  name "coprem"
  desc "GitHub Enterprise Copilot premium-request analytics CLI"
  homepage "https://github.com/bariiss/coprem"

  binary "coprem"

  post-install do
    if OS.mac?
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", "#{staged_path}/coprem"]
    end
  end

  # No zap needed: the binary is a standalone CLI with no app bundles.
end
