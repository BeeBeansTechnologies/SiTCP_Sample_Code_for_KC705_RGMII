module
	RGMII2GMII(
		input	wire			RGMII_RX_CLK,
		input	wire	[ 3:0]	RGMII_RXD,
		input	wire			RGMII_RXCTL,
		output	wire			GMII_RX_CLK,
		output 	wire	[ 7:0]	GMII_RXD,
		output	wire			GMII_RX_DV,
		output	wire			GMII_RX_ER
	);


	wire			RXC_BUFIO;
    wire	[ 3:0]	RGMII_RXD_DLY;
    wire			RGMII_RXCTL_DLY;
	wire			GMII_DV_ER;

	BUFIO	BUFIO_PHY_CLK	(.O(RXC_BUFIO),		.I(RGMII_RX_CLK));
	BUFG	BUFG_RGMII_RxClk(.O(GMII_RX_CLK),	.I(RGMII_RX_CLK));
	
	generate
		genvar I;
		for(I=0;I<4;I=I+1)	begin: genddr


			IDDR	#(
				.DDR_CLK_EDGE			("SAME_EDGE_PIPELINED"),	// "OPPOSITE_EDGE", "SAME_EDGE"  or "SAME_EDGE_PIPELINED" 
				.INIT_Q1				(1'b0),						// Initial value of Q1: 1'b0 or 1'b1
				.INIT_Q2				(1'b0),						// Initial value of Q2: 1'b0 or 1'b1
				.SRTYPE					("SYNC")					// Set/Reset type: "SYNC" or "ASYNC" 
			)
			IDDR_RXD	(
				.Q1						(GMII_RXD[I]),				// 1-bit output for positive edge of clock 
				.Q2						(GMII_RXD[I+4]),			// 1-bit output for negative edge of clock
				.C						(RXC_BUFIO),				// 1-bit clock input
				.CE						(1'b1),						// 1-bit clock enable input
				.D						(RGMII_RXD[I]),				// 1-bit DDR data input
				.R						(1'b0),						// 1-bit reset
				.S						(1'b0)						// 1-bit set
			);	
		end
	endgenerate



	IDDR	#(
		.DDR_CLK_EDGE			("SAME_EDGE_PIPELINED"),	// "OPPOSITE_EDGE", "SAME_EDGE"  or "SAME_EDGE_PIPELINED" 
		.INIT_Q1				(1'b0),						// Initial value of Q1: 1'b0 or 1'b1
		.INIT_Q2				(1'b0),						// Initial value of Q2: 1'b0 or 1'b1
		.SRTYPE					("SYNC")					// Set/Reset type: "SYNC" or "ASYNC" 
	)
	IDDR_CTL	(
		.Q1						(GMII_RX_DV),				// 1-bit output for positive edge of clock 
		.Q2						(GMII_DV_ER),				// 1-bit output for negative edge of clock
		.C						(RXC_BUFIO),				// 1-bit clock input
		.CE						(1'b1),						// 1-bit clock enable input
		.D						(RGMII_RXCTL),				// 1-bit DDR data input
		.R						(1'b0),						// 1-bit reset
		.S						(1'b0)						// 1-bit set
	);	

	assign	GMII_RX_ER = GMII_RX_DV ^ GMII_DV_ER;

endmodule