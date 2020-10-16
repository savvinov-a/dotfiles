task default: %w[install]

task :install do
  puts "Initializing"
  files = %w{vimrc zshrc tmux.conf ideavimrc}
  files.each do |file|
    puts "Moving original ~/.#{file} to ~/.#{file}.backup"
    move_file(file)
    puts "Creating hardlink ~/dotfiles/vimrc to ~/.vimrc"
    link_file(file)
    puts "Created..."
  end
  sync_nvim_config
  puts "Nvim synced with vim..."
end

def move_file(file)
  system %Q{mv "$HOME/.#{file}" "$HOME/.#{file}.backup"}
end

def link_file(file)
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def sync_nvim_config
  system %Q(mkdir "$HOME/.config")
  system %Q(mkdir "$HOME/.config/nvim")
  system %Q(ln -s "$PWD/init.vim" "$HOME/.config/nvim/init.vim")
end
