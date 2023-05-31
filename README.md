# Building-a-data-warehouse-for-the-retail-industry
Dự án xây dựng kho dữ liệu dự trên một tập dữ liệu về của một cửa hàng bán lẻ

### 1. Xác định business process
- Dựa vào tập dữ liệu thì chúng ta cần đưa ra các báo cáo về doanh số tổng quan 
của cũng như chi tiết của từng sản phẩm dựa theo từng thuộc tính khác nhau trong tập 
dữ liệu và đưa ra các nhận xét về cách vận hành của các phương thức vận chuyển từ đó 
cải thiện hiệu quả. Ngoài ra, còn có thể so sánh hiệu quả bán hàng của các đất nước và 
khu vực khác nhau.
- Từ các yêu cầu đó thì kho dữ liệu sẽ có:
  - Hai bảng Fact gồm FactSales và FactDelivery cả hai đều thuộc loại Transactions. Business process của mỗi bản Fact:
    - FactSales: Dùng để phân tích và báo cáo doanh số, lợi nhuận và số lượng bán ra của từng sản phẩm theo từng thuộc tính.
    - FactDelivery: Báo cáo về hoạt động của việc vận chuyển đơn hàng đến cho người dùng
  - Các bảng Dim gồm có: DimDepartment, DimShippingMode, DimTime, DimMarket, DimRegion, DimSegment, DimCustomer, DimCountry, DimCity, DimCategory, DimProduct. Dùng để cung cấp thông tin cho bảng Fact.
### 2. Lược đồ 
- Snowflake Schema
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/25423296/163456776-7f95b81a-f1ed-45f7-b7ab-8fa810d529fa.png">
  <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png">
  <img alt="Shows an illustrated sun in light mode and a moon with stars in dark mode." src="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png">
</picture>

- Constellation Schema
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/25423296/163456776-7f95b81a-f1ed-45f7-b7ab-8fa810d529fa.png">
  <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png">
  <img alt="Shows an illustrated sun in light mode and a moon with stars in dark mode." src="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png">
</picture>
