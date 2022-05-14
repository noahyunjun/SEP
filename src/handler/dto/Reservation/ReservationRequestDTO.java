package handler.dto.Reservation;

public class ReservationRequestDTO {

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getReserv_user() {
        return reserv_user;
    }

    public void setReserv_user(String reserv_user) {
        this.reserv_user = reserv_user;
    }

    public String getReserv_userId() {
        return reserv_userId;
    }

    public void setReserv_userId(String reserv_userId) {
        this.reserv_userId = reserv_userId;
    }

    public String getReserv_date() {
        return reserv_date;
    }

    public void setReserv_date(String reserv_date) {
        this.reserv_date = reserv_date;
    }

    public String getReserv_time() {
        return reserv_time;
    }

    public void setReserv_time(String reserv_time) {
        this.reserv_time = reserv_time;
    }

    public String getReserv_NOP() {
        return reserv_NOP;
    }

    public void setReserv_NOP(String reserv_NOP) {
        this.reserv_NOP = reserv_NOP;
    }

    public String getReserv_table_num() {
        return reserv_table_num;
    }

    public void setReserv_table_num(String reserv_table_num) {
        this.reserv_table_num = reserv_table_num;
    }

    public String getR_code() {
        return r_code;
    }

    public void setR_code(String r_code) {
        this.r_code = r_code;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    private String oid;
    private String reserv_user;
    private String reserv_userId;
    private String reserv_date;
    private String reserv_time;
    private String reserv_NOP;
    private String reserv_table_num;
    private String r_code;
    private String verifyCode;

}
