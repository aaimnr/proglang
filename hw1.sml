fun is_older (date1 : int*int*int ,date2:int*int*int) =
    (#1 date1 < #1 date2 ) 
    orelse (#1 date1 = #1 date2) andalso 
	( (#2 date1 < #2 date2) orelse ( 
	    (#2 date1 = #2 date2 andalso 
	      #3 date1 < #3 date2)))
 

fun number_in_month (dates : (int*int*int) list, month : int) =
    if null dates 
    then 0 
    else ( if (#2 (hd dates)) = month then 1 else 0 ) + number_in_month(tl dates, month)

fun number_in_months (dates : (int*int*int) list, months: int list) = 
		      if null months
		      then 0
		      else number_in_month(dates,hd months) + number_in_months(dates,tl months)

fun dates_in_month (dates : (int*int*int) list, month : int) =
    if null dates
    then []
    else 
	let val cur_date = hd dates
	in
	    if #2 cur_date = month then cur_date :: dates_in_month(tl dates, month)
	    else dates_in_month(tl dates, month)
	end

fun dates_in_months (dates : (int*int*int) list, months : int list) =
    if null months
    then []
    else dates_in_month(dates,hd months) @ dates_in_months(dates, tl months)
							  
fun get_nth (str : string list, n : int) = 
    let 
	fun get_nth_rec(str : string list, cur : int) =
	    if cur = n
	    then hd str
	    else get_nth_rec(tl str, cur + 1)
    in 
	get_nth_rec(str,1)
    end

fun date_to_string ( date:(int*int*int)) = 
    let
	val months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    in
	get_nth(months, #2 date) ^" "^ Int.toString(#1 date) ^ ", " ^ Int.toString(#3 date)
    end


fun number_before_reaching_sum (sum : int, lst : int list) =
    let 
	fun sum_rec (lst : int list, cur_sum : int, cur_element : int) = 
	    if cur_sum + hd lst >= sum
            then cur_element - 1
	    else sum_rec(tl lst, cur_sum + hd lst, cur_element + 1)
    in
	sum_rec(lst, 0, 1)
    end

fun what_month ( day : int) = 
    let
	val month_lens = [31,28,31,30,31,30,31,31,30,31,30,31]
     in number_before_reaching_sum (day, month_lens)+1
    end
    

fun month_range (day1 : int, day2 : int) =
    let 
	fun month_range_rec ( cur_num : int, cur_range : int list) = 
	    if cur_num > day2
	    then cur_range
	    else month_range_rec ( cur_num + 1, cur_range :: 
	
