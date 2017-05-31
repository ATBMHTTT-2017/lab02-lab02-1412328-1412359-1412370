// Giải pháp mã hóa thông tin lương để chỉ nhân viên được phép xem lương của mình.
--Ham Hash Key
CREATE OR REPLACE FUNCTION Hash_Key(ikey IN VARCHAR2)
return RAW DETERMINISTIC
IS
  rkey RAW(128) := UTL_RAW.cast_to_raw(ikey);
  keyhash RAW(1024);
BEGIN
	keyhash := dbms_crypto.hash(  src => rkey,
                                typ => dbms_crypto.HASH_SH1);
	return keyhash;
END Hash_Key;

--Ham Ma Hoa
CREATE OR REPLACE FUNCTION encrypt_SALARY(luong IN VARCHAR2,ikey IN VARCHAR2)
return RAW DETERMINISTIC
IS
  rkey RAW(128) := UTL_RAW.cast_to_raw(ikey);
  rluong RAW(1024) := utl_raw.cast_to_raw(luong);
  luong_encrypted RAW(1024);
BEGIN
	luong_encrypted := dbms_crypto.encrypt( src => rluong,
                                          typ => dbms_crypto.DES_CBC_PKCS5,
                                          key => rkey );
	return luong_encrypted;
END encrypt_SALARY;

--Ham Giai Ma
CREATE OR REPLACE FUNCTION decrypt_SALARY(luong IN VARCHAR2,hashkey in VARCHAR2,ikey IN VARCHAR2)
return VARCHAR2 DETERMINISTIC
IS
  rkey RAW(128) := UTL_RAW.cast_to_raw(ikey);
  luong_decrypted raw(1024);
  key_HASH raw(1024);
BEGIN
	key_HASH := dbms_crypto.hash( src => rkey,
                                typ => dbms_crypto.HASH_SH1);

	IF (key_HASH = hashkey) THEN
    luong_decrypted := dbms_crypto.decrypt( src => luong,
                                            typ => dbms_crypto.DES_CBC_PKCS5,
                                            key => rkey);
    return utl_raw.cast_to_varchar2(luong_decrypted);
	ELSE
		return TO_CHAR(luong);
	END IF;
  
END decrypt_SALARY;

--Thuc hien viec them cot du lieu HashKey voi cac key da duoc ma hoa bang ham Hash_Key
ALTER TABLE NhanVien ADD hashKey VARCHAR2(128);
UPDATE system.NhanVien SET hashKey = Hash_Key('pass001') WHERE maNV = 'NV1';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass002') WHERE maNV = 'NV2';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass003') WHERE maNV = 'NV3';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass004') WHERE maNV = 'NV4';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass005') WHERE maNV = 'NV5';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass006') WHERE maNV = 'NV6';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass007') WHERE maNV = 'NV7';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass008') WHERE maNV = 'NV8';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass009') WHERE maNV = 'NV9';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass010') WHERE maNV = 'NV10';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass011') WHERE maNV = 'NV11';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass012') WHERE maNV = 'NV12';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass013') WHERE maNV = 'NV13';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass014') WHERE maNV = 'NV14';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass015') WHERE maNV = 'NV15';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass016') WHERE maNV = 'NV16';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass017') WHERE maNV = 'NV17';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass018') WHERE maNV = 'NV18';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass019') WHERE maNV = 'NV19';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass020') WHERE maNV = 'NV20';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass021') WHERE maNV = 'NV21';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass022') WHERE maNV = 'NV22';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass023') WHERE maNV = 'NV23';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass024') WHERE maNV = 'NV24';
UPDATE system.NhanVien SET hashKey = Hash_Key('pass025') WHERE maNV = 'NV25';
--Ma hoa cot luong voi HashKey tuong ung 
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass001') where maNV = 'NV1';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass002') where maNV = 'NV2';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass003') where maNV = 'NV3';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass004') where maNV = 'NV4';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass005') where maNV = 'NV5';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass006') where maNV = 'NV6';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass007') where maNV = 'NV7';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass008') where maNV = 'NV8';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass009') where maNV = 'NV9';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass010') where maNV = 'NV10';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass011') where maNV = 'NV11';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass012') where maNV = 'NV12';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass013') where maNV = 'NV13';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass014') where maNV = 'NV14';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass015') where maNV = 'NV15';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass016') where maNV = 'NV16';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass017') where maNV = 'NV17';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass018') where maNV = 'NV18';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass019') where maNV = 'NV19';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass020') where maNV = 'NV20';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass021') where maNV = 'NV21';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass022') where maNV = 'NV22';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass023') where maNV = 'NV23';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass024') where maNV = 'NV24';
UPDATE system.NhanVien SET luong = encrypt_SALARY(luong, 'pass025') where maNV = 'NV25';

--Xem bang NhanVien sau khi da ma hoa cot Luong va HashKey
select * from system.NhanVien;
--Test
select maNV,hoTen, decrypt_SALARY(luong,hashKey,'pass010') AS Luong from system.NhanVien;
