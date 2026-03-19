pub fn unwrap_or_default(foo: Option<u32>, bar: u32) -> u32 {

    if let Some(bar) = foo {
        println!(" Some has value inside {}", bar)

        return bar
    }

    println!("default value (second parameter) : {}", bar)

    return bar
}

fn main() {

    let result1 = unwrap_or_default(Some(123), 100)
println!("result1 = {}", result1)

    let result2 = unwrap_or_default(None, 100)
println!("result2 = {}", result2)



}