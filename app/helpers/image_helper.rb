module ImageHelper
  class SmileysValidation
  	def initialize()
  		@chars = Regexp.compile("^\s*['%sÞ]*\s*$" % Regexp.escape('^#&)(*-,/.0398€;:=<>@CBDOPSTX[]\_cbdmoqpuwv}|~!'))
  		#pass
		end
  	def is_valid(txt)
  		return @chars.match(txt)
    end
  end
end
