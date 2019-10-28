package com.csdj.service.lk.about;

import com.csdj.dao.lk.about.AboutMapper;
import com.csdj.entity.FsAbout;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 */
@Service("aboutService")
public class AboutServiceImpl implements AboutService {

    @Autowired
    private AboutMapper aboutMapper;

    @Override
    public FsAbout show_About() {
        return aboutMapper.getSelect_About();
    }
}
