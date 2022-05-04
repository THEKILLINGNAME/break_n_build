Ransack.configure do |c|
  c.custom_arrows = {
    up_arrow: "<svg width=\"1.5rem\" height=\"1.5rem\">#{File.read("app/assets/images/icons/chevron-up-circle-outline.svg")}</svg>",
    down_arrow: "<svg width=\"1.5rem\" height=\"1.5rem\">#{File.read("app/assets/images/icons/chevron-down-circle-outline.svg")}</svg>",
    default_arrow: ''
  }
end
