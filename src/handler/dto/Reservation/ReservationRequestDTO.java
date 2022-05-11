package handler.dto.Reservation;

public class ReservationRequestDTO {

    private String oid;
    private String reserv_user;
    private String reserv_userId;
    private String reserv_date;
    private String reserv_time;
    private String r_code;
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
        System.out.println("getReserv 실행");
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

    public String getR_code() {
        return r_code;
    }

    public void setR_code(String r_code) {
        this.r_code = r_code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }


    private String message;
    private String verifyCode;

}
