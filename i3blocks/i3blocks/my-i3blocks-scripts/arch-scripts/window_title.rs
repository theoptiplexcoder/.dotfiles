use std::process::Command;

fn main() {
    let output = Command::new("sh")
        .arg("-c")
        .arg(
            r#"swaymsg -t get_tree | jq -r '.. | objects | select(.focused? == true).name // empty'"#,
        )
        .output()
        .expect("failed to execute command");

    let title = String::from_utf8_lossy(&output.stdout);

    print!("{}", title);
}
