# See "Multiple vulnerabilities in parameter passing in Action Pack" at
# https://groups.google.com/forum/#!topic/rubyonrails-security/61bkgvnSGTQ/discussion
ActionDispatch::ParamsParser::DEFAULT_PARSERS.delete(Mime::XML) 
