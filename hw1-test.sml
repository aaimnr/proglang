use "hw1.sml";
val t = 3;
is_older ((1980,1,1),(1981,2,2));
is_older((1980,1,1),(1980,1,2));
not (is_older((1980,5,5),(1979,1,1)));
not (is_older((1980,5,5),(1980,5,5)));

val nim1 = 3 = number_in_month([(1980,1,1),(1990,2,1),(1990,1,1),(1980,1,1)],1);

val nims1 = 4 = number_in_months([(1980,1,1),(1990,2,1),(1990,1,1),(1980,1,1),(1980,3,1)],[1,3]);

val dim1 =  ([(1980,1,1),(1990,1,1),(1981,1,1)] = dates_in_month([(1980,1,1),(1990,2,1),(1990,1,1),(1981,1,1)],1));

val dims1 =  ([(1980,1,1),(1990,1,1),(1981,1,1),(1970,3,2)] = dates_in_months([(1980,1,1),(1990,2,1),(1990,1,1),(1981,1,1),(1970,3,2)],[1,3]));

val getnth1 = "two" = get_nth (["one","two","three","four"],2);

val dts1 = "January 20, 2013" = date_to_string(20,1,2013);

val nbrs1 = 3 = number_before_reaching_sum( 30, [ 10, 15, 4, 12 ] );
val nbrs2 = 5 = number_before_reaching_sum( 6, [1,1,1,1,1,1,1,1,1,1]);

val wm1 = 2 = what_month(32);
val wm2 = 12 = what_month(365);
val wm3 = 11 = what_month(365-31);
