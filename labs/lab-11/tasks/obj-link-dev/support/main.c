// SPDX-License-Identifier: BSD-3-Clause

extern int qty;
int main(void)
{
    set_price(21);
    print_price();
    qty = 42;
    print_quantity();
    /*
     * TODO: Make it so you print:
     *    price is 21
     *    quantity is 42
     * without directly calling a printing function.
     */

    return 0;
}
