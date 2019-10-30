package com.csdj.service.lk.praise;

import com.csdj.dao.lk.praise.PraiseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("praiseService")
public class PraiseServiceImpl implements PraiseService {

    @Autowired
    private PraiseMapper praiseMapper;

    @Override
    public List<Integer> show_Praise_Count(int praisePeopleId) {
        return praiseMapper.getSelect_Praise_Count(praisePeopleId);
    }

    @Override
    public int show_Is_Praise(int postId, int praisePeopleId) {
        return praiseMapper.getSelect_Is_Praise(postId,praisePeopleId);
    }
}
