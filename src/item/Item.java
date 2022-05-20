package item;

// 우선 편의를 위해 String으로 모두 작성한다. 불러온 이후 int형으로 바꾸자

public class Item {

	private String itemNum;
	private String itemCategory;
	private String itemName;
	private String itemPrice;
	private String itemVolume;
	private String itemInformation;
	private String itemDate;
	
	public String getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getItemImageDetail() {
		return itemImageDetail;
	}
	public void setItemImageDetail(String itemImageDetail) {
		this.itemImageDetail = itemImageDetail;
	}
	private String itemImage;
	private String itemImageDetail;
	
	public String getItemNum() {
		return itemNum;
	}
	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}
	public String getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemVolume() {
		return itemVolume;
	}
	public void setItemVolume(String itemVolume) {
		this.itemVolume = itemVolume;
	}
	public String getItemInformation() {
		return itemInformation;
	}
	public void setItemInformation(String itemInformation) {
		this.itemInformation = itemInformation;
	}
	public String getItemDate() {
		return itemDate;
	}
	public void setItemDate(String itemDate) {
		this.itemDate = itemDate;
	}
	public String getItemImage() {
		return itemImage;
	}
	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
}
