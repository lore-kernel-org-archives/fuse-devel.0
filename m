Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFFF48987D
	for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640493; cv=none; b=MKN0CTDmExfuXuyY4BRqXsW8nf0Zt1qnh44ylS3J9Xpgj/MxoXZsMifO5Iewy12VYIRKcVXAi82R/kOXOXkZ8ZWFGqcZqy2+Lu2hN8PZzMEVlwXVlbfdLpWCyJva803sdKF2Ax+WcdA/SfUdjFSO7fYr/u4qxrW5XTij3v8l80I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640493; c=relaxed/simple;
	bh=nzq8hPFh0MLhLgKs3f4eiTWCY5j/h8Lwe/TvWsHY30M=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=Peeg7lvhHMQkz88bU/W4GXutzZ7HZmINllef24JbFw5qqKqxMXWn33sUWUQ4K9wxJQLD9ShMv2UsqTcY1vJ8b+QxurN8fvFYqKkGzwKtHPbv1WDqPR/D8d8KTFpa4+B/pagS/oaYbu2XBExHNbhww0O0MQK7JiQL2DDLwpDHzEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=fa7ZeYZm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hPLKqFIR; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="fa7ZeYZm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hPLKqFIR"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7CA737A002D;
	Thu, 13 Aug 2026 13:01:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 13 Aug 2026 13:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1786640490; x=1786726890; bh=aVQdEqgKyX
	cCSfKBDO9paiPIjpLvjQeNUJa+bVPdvm8=; b=fa7ZeYZm0vOrYAvx2A74/Y3ZfV
	NIPQxiQ6o5acxt2QcFzpCiqMKbwjT2SjKpT9CV8B/+R6CMdQDOjBwRRStNs6oTeU
	15zuFJvY6X1fP5f8LfCsBtRQt8HYSKyAx6GNTvu9jRgj4DW6hb3VB9V9DgGPyOfK
	P+U+qLRbCc3naoOFTkjj8PZxRbSP8GWqQO1egLqBBVLatLfqY2Be90UAWr8w1v0i
	AcO9IoKVuM+R91DSv7+0OZJkdMfUpWzQ74LXl/2JhoB8JaCfBY2wzAcw7lhLARET
	mfRbk++Uzwpe6/QD3It5aDmkRRvRGhRuq2tY7+vWMQxeM7DtgqGX67RbL6ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786640490; x=1786726890; bh=aVQdEqgKyXcCSfKBDO9paiPIjpLvjQeNUJa
	+bVPdvm8=; b=hPLKqFIR8LJdt2xjdpVW8UjcCmxynGgb6l73hliBnI5haMGAYXK
	lo7PFX7Ksb3QQXQc5390gDzO9+Lavb8tkPd0OOXMT9Jvt/FJj2SUiqqY4TCJZd3C
	QwUOSE1re1myEMELlTvacyXXY+q67vLwrEm3ge3dAorlH1YSWEE9KtjuxawZ3Q3k
	ab+zWXtyTRuvQQ/w/AKb/tVt3Rt05ujkcLbGLPh1tbaCW2F5M7T8pzAfhS5rtuyq
	x9i8ml6zQmb/RNLOHZRoF0RggHDMzcAvJMInjdePO79m8ffGFACxfxqVWs1669JA
	9/qJdA30VhD86+rR2fjt3o2dxAnssnWz7Xw==
X-ME-Sender: <xms:afh9arPxqmA6t43LQVddK7NkZ7lapBiUhOOVcKSFtJosm_jg_M7HbQ>
    <xme:afh9amopo1cWWZzlci3NdkrXEiKMXQ31p1X0kvxGduC8C3K-VPrTfpFJ7yZzmtT4G
    oRchY1PrddwqLDDRnC7FGPNuDHeZouGGltKa-nNwHL9eVIqimgb>
X-ME-Received: <xmr:afh9aoeyGkm6fADr_In77xpygRRkvoSb8jVl-BUz73C67pownTU_fl7VjTx8dxaQLdqe7FQhFsDcZw-bJJewKSgxoXS22CyT-nWTHu0g6me3ddolyuYMOllT>
X-ME-Proxy-Cause: dmFkZTFvgBeH1S+nD/YmBEIErfVD2dnPom2FaOi3L4q4po+K+aC7a6AVm7M/wlgR5g55dR
    M1qgsENqrCldYkObVOCuw81UT1i5i1eaLR5T84s6s9KL9cvVd5fAYugUoeTzqJ8sQS/jdH
    CqL4mUIGiMaeJ0i/jo7ISvhNYT7B+fYLVMj2gPWn+rhl3Xe0pDVOXUVgRoAikFJORx5P6G
    OyF4bPOBr09158+7MT6nmuCd0RW/R6qOE5JlzVFlWn4LQ2ybHKLl+nAhQruFPOCGvb+tmQ
    IfvAFa+4aYYdLjgXrB84XaKuKEchfk2B39JMzVvn48Sb74YLPXZWJ/LR35J85Gi77ywIEh
    GZi/D4c+OtFpssF293pLTONE0DolW+OK5ahPFK8TcRi/M0qmwzi+tPqDVf/XzQF9/UoITn
    OTwm7tNsYUucy2wH2EmXMPcuJfepPX4coIMUdYn8ugjmuo09IREuCCNH6MxCkzaAmXQJ/3
    gYvfcEfkZ/tg/MLHuXsOyTI+paCgVQYOk3zmqdtvlNkUITdBlSeoD1hZ2ANM/SrJlRB2N9
    i7TcK5KmhNwtY0DmP0w4ZDnGGNAFfkpTwYchcmAZhMXyk0bPubj419NHf8oVSQe2XRWEpj
    OrCWhshmfjwzqq6GH8iZZmg7MKZva3y+y25VCigqWbh54ug+mUHkkZmEwHUA
X-ME-Proxy: <xmx:afh9akSthBUAk6hiGw_lnMkxhPU9Y_TOqeIf6QYrY4HKZ-dnEhTP2A>
    <xmx:afh9apY5s4MaZXM1oJ_78wx1mleKNCRKcFqWJh1VmDz5XJE_RZqWFQ>
    <xmx:afh9avdDvdEO307Uj2q5dsIyMaYnLwyBsAC3vR_shAsgZcXfqq0AVA>
    <xmx:afh9aiKY5sW0junZ-2m_nEfcXdI03TRBd2CbGKMXCpMM0x7HoILkNg>
    <xmx:avh9aq4bdyVKxasJ_PJ5-Bk8H6xfTtvJIRYO_0sXuHXKDTb7BQyoXYOU>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 13:01:27 -0400 (EDT)
Content-Type: multipart/mixed; boundary="------------L6zYhcaaJdCWteYj84GaszRm"
Message-ID: <d8ead20f-91b6-49d6-95f5-f54dd76a411d@bsbernd.com>
Date: Thu, 13 Aug 2026 19:01:26 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] fuse: add zero-copy over io-uring
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com,
 axboe@kernel.dk, amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-6-joannelkoong@gmail.com>
 <777e9671-aff7-41e7-911c-dc3aacc877f3@bsbernd.com>
 <CAJnrk1bmxOXn=4W8fgn1ckGsoJasQ0AzuZpBP46uA3bhQvyjLA@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1bmxOXn=4W8fgn1ckGsoJasQ0AzuZpBP46uA3bhQvyjLA@mail.gmail.com>

This is a multi-part message in MIME format.
--------------L6zYhcaaJdCWteYj84GaszRm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/13/26 01:19, Joanne Koong wrote:
> On Wed, Aug 12, 2026 at 3:30 PM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>>> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
>>> index d50792162d8b..3d1910a9db52 100644
>>> --- a/fs/fuse/dev.c
>>> +++ b/fs/fuse/dev.c
>>> @@ -1247,11 +1247,20 @@ int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
>>>
>>> @@ -746,6 +786,62 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
>>>       return err;
>>>  }
>>>
>>> +static void fuse_zero_copy_release(void *priv)
>>> +{
>>> +     struct fuse_zero_copy_bvs *zc_bvs = priv;
>>> +     unsigned int i;
>>> +
>>> +     for (i = 0; i < zc_bvs->nr_bvs; i++)
>>> +             folio_put(page_folio(zc_bvs->bvs[i].bv_page));
>>> +
>>> +     kfree(zc_bvs);
>>
>> kvfree (see below)?
>>
>>> +}
>>> +
>>> +static int fuse_uring_set_up_zero_copy(struct fuse_ring_ent *ent,
>>> +                                    struct fuse_req *req,
>>> +                                    unsigned int issue_flags)
>>> +{
>>> +     struct fuse_args_pages *ap;
>>> +     int err, i, ddir = 0;
>>> +     struct fuse_zero_copy_bvs *zc_bvs;
>>> +     struct bio_vec *bvs;
>>> +
>>> +     /* out_pages indicates a read, in_pages indicates a write */
>>> +     if (req->args->out_pages)
>>> +             ddir |= IO_BUF_DEST;
>>> +     if (req->args->in_pages)
>>> +             ddir |= IO_BUF_SOURCE;
>>> +
>>> +     ap = container_of(req->args, typeof(*ap), args);
>>> +
>>> +     zc_bvs = kmalloc(struct_size(zc_bvs, bvs, ap->num_folios),
>>> +                      GFP_KERNEL_ACCOUNT);
>>
>> Assuming one folio per page and 1MB max_nr_pages:
>>
>> struct_size(zc_bvs, bvs, n) == 8 + 16 * 256 = 4104
>>
>> Shouldn't this be kvmalloc()?
> 
> I'm not sure what the upper limit is for a kmalloc, but I'll change
> this to kvmalloc().


As far as I know kmalloc will allocate continuos pages and might fail
under fragmentation if more than a page is needed. I'm not entirely sure
if kvmalloc for such a small allocation will actually do the job.
How about the attached patch? And with that maybe we should limit
max_nr_pages to 256 for ZC?

Thanks,
Bernd
--------------L6zYhcaaJdCWteYj84GaszRm
Content-Type: text/x-patch; charset=UTF-8;
 name="io_buffer_register_bvec-self-release.patch"
Content-Disposition: attachment;
 filename="io_buffer_register_bvec-self-release.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2ZzL2Z1c2UvZGV2X3VyaW5nLmMgYi9mcy9mdXNlL2Rldl91cmluZy5j
CmluZGV4IGQ3ZDUxNzQ5N2ExZS4uZTFiNTVmN2MwYzA5IDEwMDY0NAotLS0gYS9mcy9mdXNl
L2Rldl91cmluZy5jCisrKyBiL2ZzL2Z1c2UvZGV2X3VyaW5nLmMKQEAgLTM0LDExICszNCw2
IEBAIHN0cnVjdCBmdXNlX3VyaW5nX3BkdSB7CiAJc3RydWN0IGZ1c2VfcmluZ19lbnQgKmVu
dDsKIH07CiAKLXN0cnVjdCBmdXNlX3plcm9fY29weV9idnMgewotCXVuc2lnbmVkIGludCBu
cl9idnM7Ci0Jc3RydWN0IGJpb192ZWMgYnZzW107Ci19OwotCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGZ1c2VfaXF1ZXVlX29wcyBmdXNlX2lvX3VyaW5nX29wczsKIAogZW51bSBmdXNlX3Vy
aW5nX2hlYWRlcl90eXBlIHsKQEAgLTc4NiwyNCArNzgxLDEyIEBAIHN0YXRpYyBpbnQgZnVz
ZV91cmluZ19jb3B5X2Zyb21fcmluZyhzdHJ1Y3QgZnVzZV9yZXEgKnJlcSwKIAlyZXR1cm4g
ZXJyOwogfQogCi1zdGF0aWMgdm9pZCBmdXNlX3plcm9fY29weV9yZWxlYXNlKHZvaWQgKnBy
aXYpCi17Ci0Jc3RydWN0IGZ1c2VfemVyb19jb3B5X2J2cyAqemNfYnZzID0gcHJpdjsKLQl1
bnNpZ25lZCBpbnQgaTsKLQotCWZvciAoaSA9IDA7IGkgPCB6Y19idnMtPm5yX2J2czsgaSsr
KQotCQlmb2xpb19wdXQocGFnZV9mb2xpbyh6Y19idnMtPmJ2c1tpXS5idl9wYWdlKSk7Ci0K
LQlrZnJlZSh6Y19idnMpOwotfQotCiBzdGF0aWMgaW50IGZ1c2VfdXJpbmdfc2V0X3VwX3pl
cm9fY29weShzdHJ1Y3QgZnVzZV9yaW5nX2VudCAqZW50LAogCQkJCSAgICAgICBzdHJ1Y3Qg
ZnVzZV9yZXEgKnJlcSwKIAkJCQkgICAgICAgdW5zaWduZWQgaW50IGlzc3VlX2ZsYWdzKQog
ewogCXN0cnVjdCBmdXNlX2FyZ3NfcGFnZXMgKmFwOwogCWludCBlcnIsIGksIGRkaXIgPSAw
OwotCXN0cnVjdCBmdXNlX3plcm9fY29weV9idnMgKnpjX2J2czsKIAlzdHJ1Y3QgYmlvX3Zl
YyAqYnZzOwogCiAJLyogb3V0X3BhZ2VzIGluZGljYXRlcyBhIHJlYWQsIGluX3BhZ2VzIGlu
ZGljYXRlcyBhIHdyaXRlICovCkBAIC04MTQsMTMgKzc5NywxMSBAQCBzdGF0aWMgaW50IGZ1
c2VfdXJpbmdfc2V0X3VwX3plcm9fY29weShzdHJ1Y3QgZnVzZV9yaW5nX2VudCAqZW50LAog
CiAJYXAgPSBjb250YWluZXJfb2YocmVxLT5hcmdzLCB0eXBlb2YoKmFwKSwgYXJncyk7CiAK
LQl6Y19idnMgPSBrbWFsbG9jKHN0cnVjdF9zaXplKHpjX2J2cywgYnZzLCBhcC0+bnVtX2Zv
bGlvcyksCi0JCQkgR0ZQX0tFUk5FTF9BQ0NPVU5UKTsKLQlpZiAoIXpjX2J2cykKKwkvKiBv
bmx5IG5lZWRlZCB1bnRpbCByZWdpc3RyYXRpb24gY29waWVzIGl0IGludG8gdGhlIHJpbmcg
Ki8KKwlidnMgPSBrbWFsbG9jX2FycmF5KGFwLT5udW1fZm9saW9zLCBzaXplb2YoKmJ2cyks
IEdGUF9LRVJORUxfQUNDT1VOVCk7CisJaWYgKCFidnMpCiAJCXJldHVybiAtRU5PTUVNOwog
Ci0JemNfYnZzLT5ucl9idnMgPSBhcC0+bnVtX2ZvbGlvczsKLQlidnMgPSB6Y19idnMtPmJ2
czsKIAlmb3IgKGkgPSAwOyBpIDwgYXAtPm51bV9mb2xpb3M7IGkrKykgewogCQlidnNbaV0u
YnZfcGFnZSA9IGZvbGlvX3BhZ2UoYXAtPmZvbGlvc1tpXSwgMCk7CiAJCWJ2c1tpXS5idl9v
ZmZzZXQgPSBhcC0+ZGVzY3NbaV0ub2Zmc2V0OwpAQCAtODI4LDEyICs4MDksMTMgQEAgc3Rh
dGljIGludCBmdXNlX3VyaW5nX3NldF91cF96ZXJvX2NvcHkoc3RydWN0IGZ1c2VfcmluZ19l
bnQgKmVudCwKIAkJZm9saW9fZ2V0KGFwLT5mb2xpb3NbaV0pOwogCX0KIAotCWVyciA9IGlv
X2J1ZmZlcl9yZWdpc3Rlcl9idmVjKGVudC0+Y21kLCBidnMsIGFwLT5udW1fZm9saW9zLAot
CQkJCSAgICAgIGZ1c2VfemVyb19jb3B5X3JlbGVhc2UsIHpjX2J2cywKLQkJCQkgICAgICBk
ZGlyLCBlbnQtPnplcm9fY29weV9pbmRleCwKLQkJCQkgICAgICBpc3N1ZV9mbGFncyk7CisJ
ZXJyID0gaW9fYnVmZmVyX3JlZ2lzdGVyX2J2ZWMoZW50LT5jbWQsIGJ2cywgYXAtPm51bV9m
b2xpb3MsIE5VTEwsIE5VTEwsCisJCQkJICAgICAgZGRpciwgSU9fQlVGX0ZfUFVUX0ZPTElP
UywKKwkJCQkgICAgICBlbnQtPnplcm9fY29weV9pbmRleCwgaXNzdWVfZmxhZ3MpOworCWtm
cmVlKGJ2cyk7CiAJaWYgKGVycikgewotCQlmdXNlX3plcm9fY29weV9yZWxlYXNlKHpjX2J2
cyk7CisJCWZvciAoaSA9IDA7IGkgPCBhcC0+bnVtX2ZvbGlvczsgaSsrKQorCQkJZm9saW9f
cHV0KGFwLT5mb2xpb3NbaV0pOwogCQlyZXR1cm4gZXJyOwogCX0KIApkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9pb191cmluZy9jbWQuaCBiL2luY2x1ZGUvbGludXgvaW9fdXJpbmcv
Y21kLmgKaW5kZXggNDI4MDFmMGI2NDU2Li45ODA5NDhjODZjNjIgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvbGludXgvaW9fdXJpbmcvY21kLmgKKysrIGIvaW5jbHVkZS9saW51eC9pb191cmlu
Zy9jbWQuaApAQCAtNDEsNiArNDEsMTUgQEAgc3RhdGljIGlubGluZSB2b2lkIGlvX3VyaW5n
X2NtZF9wcml2YXRlX3N6X2NoZWNrKHNpemVfdCBjbWRfc3opCiAJKChwZHVfdHlwZSAqKSYo
Y21kKS0+cGR1KSBcCiApCiAKKy8qIEZsYWdzIGZvciBpb19idWZmZXJfcmVnaXN0ZXJfYnZl
YygpICovCitlbnVtIGlvX2J1ZmZlcl9yZWdpc3Rlcl9mbGFncyB7CisJLyoKKwkgKiBUaGUg
Y2FsbGVyIGhvbGRzIGEgZm9saW8gcmVmZXJlbmNlIHBlciBidmVjLCB0byBiZSBkcm9wcGVk
IHdoZW4gdGhlCisJICogYnVmZmVyIGlzIHJlbGVhc2VkLiBSZWdpc3RlcnMgd2l0aG91dCBy
ZWxlYXNlL3ByaXYuCisJICovCisJSU9fQlVGX0ZfUFVUX0ZPTElPUwk9ICgxdSA8PCAwKSwK
K307CisKICNpZiBkZWZpbmVkKENPTkZJR19JT19VUklORykKIGludCBpb191cmluZ19jbWRf
aW1wb3J0X2ZpeGVkKHU2NCB1YnVmLCB1bnNpZ25lZCBsb25nIGxlbiwgaW50IHJ3LAogCQkJ
ICAgICAgc3RydWN0IGlvdl9pdGVyICppdGVyLApAQCAtOTYsOCArMTA1LDggQEAgaW50IGlv
X2J1ZmZlcl9yZWdpc3Rlcl9yZXF1ZXN0KHN0cnVjdCBpb191cmluZ19jbWQgKmNtZCwgc3Ry
dWN0IHJlcXVlc3QgKnJxLAogCQkJICAgICAgIHVuc2lnbmVkIGludCBpc3N1ZV9mbGFncyk7
CiBpbnQgaW9fYnVmZmVyX3JlZ2lzdGVyX2J2ZWMoc3RydWN0IGlvX3VyaW5nX2NtZCAqY21k
LCBjb25zdCBzdHJ1Y3QgYmlvX3ZlYyAqYnZzLAogCQkJICAgIHVuc2lnbmVkIGludCBucl9i
dmVjcywgdm9pZCAoKnJlbGVhc2UpKHZvaWQgKiksCi0JCQkgICAgdm9pZCAqcHJpdiwgdTgg
ZGlyLCB1bnNpZ25lZCBpbnQgaW5kZXgsCi0JCQkgICAgdW5zaWduZWQgaW50IGlzc3VlX2Zs
YWdzKTsKKwkJCSAgICB2b2lkICpwcml2LCB1OCBkaXIsIHVuc2lnbmVkIGludCBmbGFncywK
KwkJCSAgICB1bnNpZ25lZCBpbnQgaW5kZXgsIHVuc2lnbmVkIGludCBpc3N1ZV9mbGFncyk7
CiBpbnQgaW9fYnVmZmVyX3VucmVnaXN0ZXIoc3RydWN0IGlvX3VyaW5nX2NtZCAqY21kLCB1
bnNpZ25lZCBpbnQgaW5kZXgsCiAJCQkgdW5zaWduZWQgaW50IGlzc3VlX2ZsYWdzKTsKICNl
bHNlCkBAIC0xNTQsNyArMTYzLDggQEAgc3RhdGljIGlubGluZSBpbnQgaW9fYnVmZmVyX3Jl
Z2lzdGVyX2J2ZWMoc3RydWN0IGlvX3VyaW5nX2NtZCAqY21kLAogCQkJCQkgIGNvbnN0IHN0
cnVjdCBiaW9fdmVjICpidnMsCiAJCQkJCSAgdW5zaWduZWQgaW50IG5yX2J2ZWNzLAogCQkJ
CQkgIHZvaWQgKCpyZWxlYXNlKSh2b2lkICopLCB2b2lkICpwcml2LAotCQkJCQkgIHU4IGRp
ciwgdW5zaWduZWQgaW50IGluZGV4LAorCQkJCQkgIHU4IGRpciwgdW5zaWduZWQgaW50IGZs
YWdzLAorCQkJCQkgIHVuc2lnbmVkIGludCBpbmRleCwKIAkJCQkJICB1bnNpZ25lZCBpbnQg
aXNzdWVfZmxhZ3MpCiB7CiAJcmV0dXJuIC1FT1BOT1RTVVBQOwpkaWZmIC0tZ2l0IGEvaW9f
dXJpbmcvcnNyYy5jIGIvaW9fdXJpbmcvcnNyYy5jCmluZGV4IGYzZjAxZTBjODEwMi4uYmQ3
M2E3ZWU5OGNjIDEwMDY0NAotLS0gYS9pb191cmluZy9yc3JjLmMKKysrIGIvaW9fdXJpbmcv
cnNyYy5jCkBAIC0xNTgsNiArMTU4LDE1IEBAIHN0YXRpYyB2b2lkIGlvX3JlbGVhc2VfdWJ1
Zih2b2lkICpwcml2KQogCX0KIH0KIAorc3RhdGljIHZvaWQgaW9fcmVsZWFzZV9rYnVmX2Zv
bGlvcyh2b2lkICpwcml2KQoreworCXN0cnVjdCBpb19tYXBwZWRfdWJ1ZiAqaW11ID0gcHJp
djsKKwl1bnNpZ25lZCBpbnQgaTsKKworCWZvciAoaSA9IDA7IGkgPCBpbXUtPm5yX2J2ZWNz
OyBpKyspCisJCWZvbGlvX3B1dChidmVjX2ZvbGlvKCZpbXUtPmJ2ZWNbaV0pKTsKK30KKwog
c3RhdGljIHN0cnVjdCBpb19tYXBwZWRfdWJ1ZiAqaW9fYWxsb2NfaW11KHN0cnVjdCBpb19y
aW5nX2N0eCAqY3R4LAogCQkJCQkgICBpbnQgbnJfYnZlY3MpCiB7CkBAIC0xMTAxLDggKzEx
MTAsOCBAQCBFWFBPUlRfU1lNQk9MX0dQTChpb19idWZmZXJfcmVnaXN0ZXJfcmVxdWVzdCk7
CiAgKi8KIGludCBpb19idWZmZXJfcmVnaXN0ZXJfYnZlYyhzdHJ1Y3QgaW9fdXJpbmdfY21k
ICpjbWQsIGNvbnN0IHN0cnVjdCBiaW9fdmVjICpidnMsCiAJCQkgICAgdW5zaWduZWQgaW50
IG5yX2J2ZWNzLCB2b2lkICgqcmVsZWFzZSkodm9pZCAqKSwKLQkJCSAgICB2b2lkICpwcml2
LCB1OCBkaXIsIHVuc2lnbmVkIGludCBpbmRleCwKLQkJCSAgICB1bnNpZ25lZCBpbnQgaXNz
dWVfZmxhZ3MpCisJCQkgICAgdm9pZCAqcHJpdiwgdTggZGlyLCB1bnNpZ25lZCBpbnQgZmxh
Z3MsCisJCQkgICAgdW5zaWduZWQgaW50IGluZGV4LCB1bnNpZ25lZCBpbnQgaXNzdWVfZmxh
Z3MpCiB7CiAJc3RydWN0IGlvX3JpbmdfY3R4ICpjdHggPSBjbWRfdG9faW9fa2lvY2IoY21k
KS0+Y3R4OwogCXN0cnVjdCBpb19tYXBwZWRfdWJ1ZiAqaW11OwpAQCAtMTEyNSw2ICsxMTM0
LDEyIEBAIGludCBpb19idWZmZXJfcmVnaXN0ZXJfYnZlYyhzdHJ1Y3QgaW9fdXJpbmdfY21k
ICpjbWQsIGNvbnN0IHN0cnVjdCBiaW9fdmVjICpidnMsCiAJZm9yIChpID0gMDsgaSA8IG5y
X2J2ZWNzOyBpKyspCiAJCWJ2ZWNbaV0gPSBidnNbaV07CiAKKwkvKiBpbXUgaXMgb25seSBr
bm93biBoZXJlLCBhbmQgbmVlZHMgdGhlIGJ2ZWNzIGluIHBsYWNlICovCisJaWYgKGZsYWdz
ICYgSU9fQlVGX0ZfUFVUX0ZPTElPUykgeworCQlpbXUtPnJlbGVhc2UgPSBpb19yZWxlYXNl
X2tidWZfZm9saW9zOworCQlpbXUtPnByaXYgPSBpbXU7CisJfQorCiB1bmxvY2s6CiAJaW9f
cmluZ19zdWJtaXRfdW5sb2NrKGN0eCwgaXNzdWVfZmxhZ3MpOwogCXJldHVybiByZXQ7Cg==


--------------L6zYhcaaJdCWteYj84GaszRm--
