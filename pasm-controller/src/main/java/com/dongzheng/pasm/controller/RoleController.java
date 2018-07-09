package com.dongzheng.pasm.controller;


import com.dongzheng.pasm.core.common.JsonResult;
import com.dongzheng.pasm.core.entity.Role;
import com.dongzheng.pasm.core.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *
 * </p>
 *
 * @author xa
 * @since 2018-06-10
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {

    @Autowired
    private IRoleService roleService;

    @RequestMapping(value = {"/index"})
    public String index(ModelMap modelMap) {
        Page<Role> page = roleService.findAll(getPageRequest());
        modelMap.put("pageInfo", page);
        return "role/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap map) {
        return "role/form";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable Integer id, ModelMap map) {
        Role role = roleService.find(id);
        map.put("role", role);
        return "role/form";
    }


    @RequestMapping(value = {"/edit"}, method = RequestMethod.POST)
    @ResponseBody
    public JsonResult edit(Role role, ModelMap map) {
        try {
            roleService.saveOrUpdate(role);
        } catch (Exception e) {
            return JsonResult.failure(e.getMessage());
        }
        return JsonResult.success();
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult delete(@PathVariable Integer id, ModelMap map) {
        try {
            roleService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.failure(e.getMessage());
        }
        return JsonResult.success();
    }

    @RequestMapping(value = "/grant/{id}", method = RequestMethod.GET)
    public String grant(@PathVariable Integer id, ModelMap map) {
        Role role = roleService.find(id);
        map.put("role", role);
        return "role/grant";
    }

    @RequestMapping(value = "/grant/{id}", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult grant(@PathVariable Integer id,
                            @RequestParam(required = false) String[] resourceIds, ModelMap map) {
        try {
            roleService.grant(id, resourceIds);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.failure(e.getMessage());
        }
        return JsonResult.success();
    }
}
