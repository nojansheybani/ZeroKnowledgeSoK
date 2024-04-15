fn main(a : [Field; 4096], b : [Field; 4096], c : pub [Field; 4096]) {
    let mut temp_field = [0; 4096];
    for i in 0..64 {
        for j in 0..64 {
            for k in 0..64 {
                temp_field[i*64 + j] += temp_field[i*64 + j] + a[i * 64 + k] * b[k * 64 + j];
            }
        }
    }

    for i in 0..4096 {
        constrain c[i] == temp_field[i];
    }
}