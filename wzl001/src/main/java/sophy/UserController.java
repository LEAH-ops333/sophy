package sophy;

import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
@RequestMapping("/api/users")
@CrossOrigin(origins = "*")
public class UserController {

    // 使用一个列表来模拟内存数据库，存储用户信息
    private List<Map<String, String>> users = new ArrayList<>();

    // 处理 GET 请求: 获取所有用户
    // 访问路径: GET /api/users
    @GetMapping
    public List<Map<String, String>> getUsers() {
        return users;
    }

    // 4. 处理 POST 请求: 添加一个新用户
    // 访问路径: POST /api/users
    // 请求体 (Body) 需要包含 JSON 格式的用户信息, 例如: {"name": "张三", "email": "zhangsan@example.com"}
    @PostMapping
    public Map<String, String> addUser(@RequestBody Map<String, String> user) {
        users.add(user);
        return user; // 返回添加成功的用户信息
    }
}