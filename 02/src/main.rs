use std::fs;

fn main() {
    let contents = fs::read_to_string("src/2.txt").expect("explod");


    let lines = contents.lines();

    let mut total = 0;

    for line in lines {
        let choices = line.split(" ").collect::<Vec<&str>>();

        let your_choice = map_to_int(choices[1]);
        let computer_choice = map_to_int(choices[0]) ;
        
        if your_choice == computer_choice { total+=3; }
        total += your_choice;
        if ((your_choice + computer_choice) % 2 == 1 && your_choice > computer_choice) || ((your_choice + computer_choice) % 2 == 0 && your_choice < computer_choice) {
            total += 6;
        }
    }   

    println!("{}", total);
}


fn map_to_int(str1: &str) -> i32 {
    if str1 == "A" || str1 == "X" {return 1;}
    else if str1 == "B" || str1 == "Y" {return 2;}
    else {return 3;}
}
