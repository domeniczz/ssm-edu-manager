import com.domenic.utils.SHA256Util;
import org.junit.Test;

/**
 * @author Domenic
 * @Description TODO
 * @Date 10/3/2022 4:53 AM
 */
public class SHA256UtilTest {
    @Test
    public void test1() throws Exception {
        String res = SHA256Util.sha256("123456");
        System.out.println(res);
        // String res2 = SHA256Util.sha256Digest("123456");
        // System.out.println(res2);
    }
}
