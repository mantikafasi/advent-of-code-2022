file = File.open("6.txt")

chars = []
pos = 0
file.each_char do |char|

    if chars.length == 4 then # change lenght to 14 for second part
        found = false
        chars.each do |c|
            if chars.count(c) > 1 then
                found = true
            end
        end

        if !found then
            puts pos
            break
        end
        chars.shift
    end
    pos += 1
    chars.append(char)

end