package kh.fin.giboo.volunteer.model.service;

import kh.fin.giboo.volunteer.model.dao.VolunteerDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VolunteerServiceImpl implements VolunteerService {

    private Logger logger = LoggerFactory.getLogger(VolunteerServiceImpl.class);

    @Autowired
    private VolunteerDAO dao;
}
