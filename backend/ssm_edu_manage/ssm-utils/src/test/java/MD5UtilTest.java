import com.domenic.utils.MD5Util;
import org.junit.Test;

import java.security.NoSuchAlgorithmException;

import static com.domenic.utils.MD5Util.verifyDigest;

/**
 * @author Domenic
 * @Description TODO
 * @Date 10/2/2022 8:31 PM
 */
public class MD5UtilTest {
    @Test
    public void test1() throws Exception {
        String res = MD5Util.md5("123456");
        System.out.println(res);
        boolean isVerified = MD5Util.verify("123456", res);
        System.out.println(isVerified);
    }

    @Test
    public void test2() throws NoSuchAlgorithmException {
        String res = MD5Util.md5Digest("123456");
        System.out.println(res);
        boolean b = verifyDigest("123456", res);
    }
}
