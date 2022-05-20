package basket;

public class Basket {
	private String basItemNum;
	private String basItemName;
	private String basItemPrice;
	private String basUserID;


	public String getBasUserID() {
		return basUserID;
	}
	public void setBasUserID(String basUserID) {
		this.basUserID = basUserID;
	}
	public String getBasItemNum() {
		return basItemNum;
	}
	public void setBasItemNum(String basItemNum) {
		this.basItemNum = basItemNum;
	}
	public String getBasItemName() {
		return basItemName;
	}
	public void setBasItemName(String basItemName) {
		this.basItemName = basItemName;
	}
	public String getBasItemPrice() {
		return basItemPrice;
	}
	public void setBasItemPrice(String basItemPrice) {
		this.basItemPrice = basItemPrice;
	}
	
}
