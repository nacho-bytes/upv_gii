/** Figura 2. código para dibujar círculos */
    int n = (int)radius;
    for (int j = 0; j <= n * 2; j++) {
        for (int i = 0; i <= n * 2; i++) {
            if (Math.pow(i - n, 2.0) + Math.pow(j - n, 2.0) 
                <= (int)Math.pow(n, 2)) {
                System.out.print(c);
            } 
            else {
                System.out.print(" "); 
            }
        }
        System.out.println();
    }

/** Figura 3. código para dibujar rectángulos */
    int b = (int) base;
    int h = (int) height;
    for (int i = 0; i < h; i++) {
        for (int j = 0; j < b; j++) {
            System.out.print(c);
        }
        System.out.println();
    } 