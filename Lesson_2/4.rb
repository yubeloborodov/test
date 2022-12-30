# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
vowel_letters = %w[а у о и э ы я ю е ё]
alphabet = ('а'..'я')
hash = {}

alphabet.each_with_index do |alphabet_letter, index|
  vowel_letters.each do |vowel_letter|
    hash[vowel_letter] = index if vowel_letter == alphabet_letter
  end
end

puts hash
