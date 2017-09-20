module Puppet::Parser::Functions
  newfunction(:homedir, :type => :rvalue, :arity => 1 ) do |args|
    user = args[0]
    case user
    when 'root'
      return '/root'
    else
      return "/home/#{user}"
    end
  end
end
