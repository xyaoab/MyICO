pragma solidity >= 0.4.22 < 0.6.0;

contract ICO {
 
   
    
	//introducing the maximum number of tokens available for sealed


    
	uint public max_tokens = 1000000;
    
 
  
	// conversion rate
    
    

	uint public usd_to_mytoken = 1000;
 

	uint public total_tokens_sold = 0;

	//mapping - This is similar to pointing two variables. Address pointing to uint type variable equity_usd.
    
	// You can also consider mapping as sort of associative arrays. equity_usd is the total value of investment in USD 

	mapping(address => uint) equity_usd;
    
	mapping(address => uint) equity_tokens;

    	// This function tells the equity of investor in terms of tokens purchased
    

	function equity_in_tokens(address investor) view public returns (uint) {
       
	 	return equity_tokens[investor]; // equity_tokens is resolved with mapping defined above against the investor address.
    
	}

	// This funtion tells the equity of investor in US dollars
    
	// This function returns approximate (ceiling) value because data type is uint. 

        function equity_in_usd(address investor) view public returns (uint) {
        
		return equity_usd[investor]; // equity_usd is resloved with mapping defined above. 
    
	}

	function buy_tokens(address investor, uint usd_invested) public {
        
		// Check the condition: if tokens are available enough 
		require(usd_invested * usd_to_mytoken + total_tokens_sold <= max_tokens, 'Token supply is not enough. Please try some less amount.');
		uint tokens_bought = usd_invested * usd_to_mytoken;

		// update mapped data structure for equity_tokens and equity_usd
         
		equity_tokens[investor] += tokens_bought; 
         
		equity_usd[investor] = equity_tokens[investor] / usd_to_mytoken;

        	// update the amount of total sold tokens
         
		total_tokens_sold += tokens_bought;
   
	}

    	//function sell_tokens(address investor, uint tokens_sold) public {
        
		// Check if investor has enough tokens that he is trying to sell, require() provide a msg for invalid cases
		
         	// update variables
         	
         
		
 		
    
	//}    
   

}
