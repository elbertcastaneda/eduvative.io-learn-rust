#[tokio::main]
async fn main() -> std::io::Result<()> {
    
    for number in 1..=4 {
        let line = number.to_string().repeat(number);

        println!("{}", line);
    }
    
    Ok(())
}