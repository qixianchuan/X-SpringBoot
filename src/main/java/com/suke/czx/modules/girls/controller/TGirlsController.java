package com.suke.czx.modules.girls.controller;

import java.util.Arrays;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;
import com.suke.czx.modules.girls.entity.TGirls;
import com.suke.czx.modules.girls.service.TGirlsService;
import com.suke.czx.common.utils.R;
import lombok.AllArgsConstructor;
import com.suke.czx.common.annotation.SysLog;
import com.suke.czx.common.base.AbstractController;



/**
 * 
 * 
 * @author qixianchuan
 * @email qixianchuan@163.com
 * @date 2019-07-03 13:46:10
 */
@RestController
@AllArgsConstructor
@RequestMapping("/girls/tgirls")
public class TGirlsController  extends AbstractController {
    private final  TGirlsService tGirlsService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("girls:tgirls:list")
    public R list(@RequestParam Map<String, Object> params){
        //查询列表数据
        QueryWrapper<TGirls> queryWrapper = new QueryWrapper<>();
        IPage<TGirls> sysConfigList = tGirlsService.page(mpPageConvert.<TGirls>pageParamConvert(params),queryWrapper);
        return R.ok().put("page", mpPageConvert.pageValueConvert(sysConfigList));
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("girls:tgirls:info")
    public R info(@PathVariable("id") Integer id){
        return R.ok().put("tGirls", tGirlsService.getById(id));
    }


    /**
     * 新增
     */
    @SysLog("新增数据")
    @RequestMapping("/save")
    @RequiresPermissions("girls:tgirls:save")
    public R save(@RequestBody TGirls tGirls){
        tGirlsService.save(tGirls);
        return R.ok();
    }


    /**
     * 修改
     */
    @SysLog("修改数据")
    @RequestMapping("/update")
    @RequiresPermissions("girls:tgirls:update")
    public R update(@RequestBody TGirls tGirls){
		tGirlsService.updateById(tGirls);
        return R.ok();
    }


    /**
     * 删除
     */
    @SysLog("删除数据")
    @RequestMapping("/delete")
    @RequiresPermissions("girls:tgirls:delete")
    public R delete(@RequestBody Integer[] ids){
		tGirlsService.removeByIds(Arrays.asList(ids));
        return R.ok();
    }
	
}
