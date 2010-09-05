require 'test_helper'
class ImageHelperTest < ActionView::TestCase
  def setup()
		@smileys = ":-) :) :o) :D :] :3 :c) :> =] 8) =) C: :-D :D 8D XD =D =3 <=3 <=8 <=3 <=8 8===D ( o )( o ) :-( :( :c :< :[ D: D8 D; D= DX v.v :-9 ;-) ;) *) ;] ;D :-P :P XP :-p :p =p :-Þ :Þ :-b :b :-O :O O_O o_o 8O OwO O-O 0_o O_o O3O o0o ;o_o; o...o 0w0 :-/ :/ :\\ =/ =\\ :S :| d:-) qB-) :)~ :-X :X :-# :# O:-) 0:3 O:)  :'( ;*( T_T TT_TT T.T :-* :* >:) >;) B) B-) 8) 8-) ^>.>^ ^<.<^ ^>_>^ ^<_<^ <3 <333 =^_^= =>.>= =<_<= =>.<= \\,,/ \\m/ \\m/\\>.</\\m/ \\o/ \\o o/ o/\\o :& :u @}-;-'--- 8€ (_!_) ^^ oO Oo".split(" ")
		@japanese = "O_O o_o OwO O-O 0_o O_o ;o_o; o...o 0w0 T_T TT_TT T.T ^>.>^ ^<.<^ ^>_>^ ^<_<^ =^_^= =>.>= =<_<= =>.<= ^^ oO Oo".split(" ")
		@val = ImageHelper::SmileyValidation.new()
	end
	test "smileys are valid" do
		for smiley in @smileys
			assert(@val.is_valid(smiley),"smiley not valid: "+smiley)
		end
	end
	test "Japanese smileys are recognized" do
	  for smiley in @japanese
			assert(@val.is_japanese_style(smiley),"smiley not recognized as japanese: '"+smiley+"'")
    end
  end
end
