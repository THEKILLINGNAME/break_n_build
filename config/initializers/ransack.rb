Ransack.configure do |c|
  c.custom_arrows = {
    up_arrow: "<svg width=\"1.25rem\" height=\"1.25rem\">#{File.read("app/assets/images/icons/chevron-up-circle-outline.svg")}</svg>",
    down_arrow: "<svg width=\"1.25rem\" height=\"1.25rem\">#{File.read("app/assets/images/icons/chevron-down-circle-outline.svg")}</svg>",
    default_arrow: ''
  }
end
