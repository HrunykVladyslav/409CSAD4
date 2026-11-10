pub fn add(left: i32, right: i32) -> i32 {
    left + right
}

#[cfg(test)]
mod tests {
    use super::add;

    #[test]
    fn basic_addition() {
        assert_eq!(add(2, 2), 4);
    }
}
