package system;

public class HTMLSalesFormatter implements SalesFormatter {
	
	private static HTMLSalesFormatter singletonInstance = null;

	private HTMLSalesFormatter() {}
	
	public static HTMLSalesFormatter getSingletonInstance() {
		
		if (singletonInstance == null) {
			synchronized (SalesFormatter.class) {
				if (singletonInstance == null) {
					singletonInstance = new HTMLSalesFormatter();
				}
			}
		}
		return singletonInstance;
	}
	
	public String formatSales(Sales sales) {
		
		String format = null;
		
		format = "<html> \n" + "\t<body> \n" + "\t\t<center><h2>Orders<\\h2><\\center> \n";

		for (Order order : sales) {
			format += "\t\t<hr> \n" + "\t\t<h4>Total = " + order.getTotalCost() + "<\\4> \n";
			for (OrderItem item : order) {
				format += "\t\t\t<p>\n";
				format += "\t\t\t\t<b>code:<\\b> " + item.getProduct().getCode() + "<br>\n";
				format += "\t\t\t\t<b>quantity:<\\b> " + item.getQuantity() + "<br>\n";
				format += "\t\t\t\t<b>price:<\\b> " + item.getProduct().getPrice() + "<br>\n";
				format += "\t\t\t<\\p>\n";
			}
		}
		
		return format += "\t<\\body>\n" + "<\\html>";
	}

}
