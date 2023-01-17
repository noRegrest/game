// TODO: Kịch bản game
// * Chọn vị trí player trên hàng đầu tiên
//  * Trong 1 turn có thể chọn 1 trong 2 hành động:
//   - Di chuyển 4 hướng
//   - Đặt tường ở vị trí khả thi
//  * Player thắng khi:
//    - Đặt trên hàng cuối của bàn cờ ở phía địch
//    - Nhốt được player còn lại vào 1 ô.
//      (Lưu ý là chỉ 1 ô, không thể nhốt player
//      trong 1 diện tích lớn hơn 2 ô)
// TODO: Định nghĩa
//  ! Trong 1 Turn chỉ có thể chọn 1 trong 2 hành động
//    * Hành động di chuyển 4 hướng:
//      - Khi bấm vào player
//        + Khả thi: giữa ô hiện tại và ô muốn tới ko có Wall chặn
//          => Hiển thị ô màu xanh (tối đa 4 ô)
//        + Không khả thi: ngược lại
//          => Hiển thị các ô không khả thi màu đỏ
//        + Chỉ cho phép di chuyển player tới ô xanh => Kết thúc turn
//    * Hành động đặt tường:
//      - Bấm vào tường, chọn vị trí
//        + Khả thi:
//          ? những vị trí không có wall
//          ? && không chặn đường đến đích
//          ? những vị trí không có wall
//        => kết thúc lượt
//        + không khả thi: ngược lại
//        => thông báo đặt tường thất bại
//        => cho phép chọn lại hành động
//    * Kiểm tra số ô khả thi của đối thủ và player:
//      + Nếu player || opponent : 0/4 => gameover