cask "coprem" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.11"
  sha256 arm:   "56d7c59df2210324c3465aa860123aeff806dc6f5232b83f51e5d51961f8017f",
         intel: "4dfa2096696670e0b09cfef89f441ee924f8f5855d40c13190b0c5703faf8161"

  url "https://github.com/bariiss/coprem/releases/download/v#{version}/coprem_#{version}_darwin_#{arch}.tar.gz"
  name "coprem"
  desc "GitHub Enterprise Copilot premium-request analytics CLI"
  homepage "https://github.com/bariiss/coprem"

  binary "coprem"

  postflight do
    next unless OS.mac?

    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/coprem"]
  end
end
