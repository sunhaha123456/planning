package com.rose.repository;

import com.rose.data.entity.TbEmployer;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

public interface EmployerRepository extends CrudRepository<TbEmployer, Long> {

    @Query(value = "select * from tb_employer where id = :id and del_flag = 0", nativeQuery = true)
    TbEmployer findOne(@Param(value = "id") Long id);

    @Query(value = "select * from tb_employer where id_card_no = :idCardNo and del_flag = 0", nativeQuery = true)
    TbEmployer findByIdCardNo(@Param(value = "idCardNo") String idCardNo);

    @Query(value = "select * from tb_employer where on_job_state != 2 and del_flag = 0", nativeQuery = true)
    List<TbEmployer> listNotQuit();

    @Modifying
    @Query(value = "update tb_employer set del_flag = 1 where id = :id", nativeQuery = true)
    int updateDelFlag(@Param(value = "id") Long id);

    @Modifying
    @Query(value =
            "update tb_employer set phone = :phone," +
            "now_place = :nowPlace," +
            "highest_education = :highestEducation," +
            "graduated_school = :graduatedSchool," +
            "graduated_date = :graduatedDate," +
            "emergency_contact_people = :emergencyContactPeople," +
            "emergency_contact_phone = :emergencyContactPeoplePhone," +
            "employer_remark = :employerRemark," +
            "last_modified = :lastUpateDate where id = :id", nativeQuery = true)
    int updateInfo(@Param(value = "id") Long id,
                   @Param(value = "phone") String phone,
                   @Param(value = "nowPlace") String nowPlace,
                   @Param(value = "highestEducation") Integer highestEducation,
                   @Param(value = "graduatedSchool") String graduatedSchool,
                   @Param(value = "graduatedDate") Date graduatedDate,
                   @Param(value = "emergencyContactPeople") String emergencyContactPeople,
                   @Param(value = "emergencyContactPeoplePhone") String emergencyContactPeoplePhone,
                   @Param(value = "employerRemark") String employerRemark,
                   @Param(value = "lastUpateDate") Date lastUpateDate);
}