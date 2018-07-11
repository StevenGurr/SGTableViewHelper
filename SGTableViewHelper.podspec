Pod::Spec.new do |s|
      s.name            = "SGTableViewHelper"
      s.version         = "0.4"
      s.summary         = "A framework to make building UITableViews easier, removing the need for all the boilerplate code."
      s.homepage        = "https://github.com/StevenGurr/SGTableViewHelper"
      s.license         = { :type => 'MIT', :file => 'LICENSE' }
      s.author          = "Steven Gurr"
      s.platform        = :ios, "9.0"
      s.source          = { :git => "https://github.com/StevenGurr/SGTableViewHelper.git", :tag => s.version.to_s }
      s.source_files    = "SGTableViewHelper", "SGTableViewHelper/**/*.swift"
      s.swift_version   = "4.1"
end
