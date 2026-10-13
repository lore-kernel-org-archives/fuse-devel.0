Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA80553E31A
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 19:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919229; cv=none; b=YPkUK3+JY9uwVS1LTYqi3RU623kznaZMRoQOGL8gBbQ/+HnM1GswB/Ekfy9sU2DnXc1DuR3kfBPXnN15p/tKE4Ynk7Xsdf2dTrCBo98Erpi0J8j85vtv0zNzP/3pPMZInYag2CePW8lE/b5rRQzN5qKt72SraU+O9mWDG1S5zpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919229; c=relaxed/simple;
	bh=AUDK8Y3S5b9VCZ22Lr+29ZFcW7M8NjLkTLsKMDrju+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npQfry5DiuYCgHfS+hgEdDZywAofRpVa1qPXEBI6xQwt0SIz2V7HVoQczxQ6cNPlLb2sxEgjys6LVt2mEOctkxLo/gwtTi7GArhEZE2VSzlhs6+UoWGiuWjkzoIdZg8edlLS+lS+y+IGkuw7SYyy1B8kEzPNXI82pcZbLSy5AWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=dapDPWWa; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Gufvy00q; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="dapDPWWa";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Gufvy00q"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DIYb4w222770
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 15:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Oal4
	PEpE1X4d2ote/KPkfgier4z3jZGSc5iK+zXC/VQ=; b=dapDPWWaADp4agqu9Bor
	uRVHOnSJlz9kUFbCNCjPM6ZIjGZuHtHBHcXyhxz23oNsQI5BvTrMAg46m1khIuif
	Il0a3ZgF6RkEVAbrCgztsVHK05dCkAkY/nlNqbAAHaVZQh1WW027fpGB6Dd9arOb
	AKstDJlECWJunHYi9UzgJGKn1qrEUWTsv3InKc6pvbDzB1GVVLzB04Td48jMH103
	3Hi95kz17S+zOJnjIak9cXm886tvTRko4Gk12XhcIFETAoGqErblo10dGdjOecrE
	dNX1BkGf10Eg/advHqRwZCcRhBysTgcM2l8ksb7DVa8jQhB5DRB/cnsuw4aonDv/
	zg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4h9macpbyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 15:20:26 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5347732a495so5583341cf.1
        for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 12:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791919226; x=1792524026; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oal4PEpE1X4d2ote/KPkfgier4z3jZGSc5iK+zXC/VQ=;
        b=Gufvy00q2WvzDlTjhzUI9Bv7D8GAezzFzK6llJRJVg7+/5pNdYIaPvTqOSqD8hwj9o
         HCcpIwpT2vzOI2Jj4+FT070NqpC/Q6B7q+lcSwvsEPu11YKLnsdFXj6SQaUU3UIglz+X
         dG3ZWg4XQoJURgnJFfUyzQGqF3dfo3RNJj6jm+tSC463U2AoAfxQBTTvYIciN7o68D+G
         2bcXM099DsiGymXxESKW8K7JxS0UsGFumF7a1u5HhdvrYy3URcdovPmS+qEZBu35hizb
         z4BojaEosXPdGgE8cZ2u9NXsAdY3pQ1bfrd9s4V9bghCQmjAZ4ZjA0pceuEEOeI13MDA
         KL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919226; x=1792524026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oal4PEpE1X4d2ote/KPkfgier4z3jZGSc5iK+zXC/VQ=;
        b=YVNBQuwDcdgfzt2NiUCQnYuErq+2TJPhxU+PVPXcj6hX84s/Vmui002dN8dsYB8ZEA
         yQr64Q/xT7+usA0tzN/ea9YbPUBWr4Bb2M+N7AQ/BHSNL+zymPR7SHPqEQ83MP4A/wOb
         DKn8ldMAD5px0DDvoY7AF8FcvqkdJA2KFgr/Dd8IIHuexiMjDpl/MyW5YRQLI7VqdtsW
         qcGTl+JKGNOp1NcGWvgJF4pd7I6V8vClmccJjgCuQf2Psi+cKTaVT4jeQ6TCqffqc1nc
         vtJNu8JbCWu9MqCVH9pSPeaGoFAyx2mW4m6acb8Y9qHWLzBGeHKhpXxfd2pq//rL3fda
         T47g==
X-Forwarded-Encrypted: i=1; AKwUvBy8JAVnHG5tMa/t5lRJtlNrLTdPHf+9y1iSO1yOdkK66in3uzNADSmZN6er5+WlVzlRJW2IxXUsaju9@lists.linux.dev
X-Gm-Message-State: AFq9FYIhnuyx4GBK8nodFLu17ojzbKoTKjPhWWAuStP8X9KEQa57ZxPc
	d8Zk6R0qGtYBs0Ee6KbUeptzYP1XMiknBQsAaw3rcsGKOrKLL1LOwjoYig+md5tjLMLt0cdd09p
	rUKCsn6dzyn1g7oTM7bDjb1DIVxaHl5ngmJcY4u+vDHjqGdUOj6eZzI6Iync=
X-Gm-Gg: AYBFou22gSrvKWMLRRjdGxMo2Ci0uTzqw6nZq3RJm1+DNeMw43RS5TEBkNe0RHzMwjl
	6HkdtYpfp3QO9tHXUP5pUPMDrPrmt7r3z3sefu2d0YmgTMhk6/IUGC7UKaTIBvhpT2wzD3lkDcr
	kQuU28iFKQyz1s8mZYgYsH4Mqgl308TCfU4KF9SL8TPOTEguBaYj2Sxrf4dMuTkQWTwyfLJNdX+
	eJLf39fSd7ZuYinH6QBq3xsIAb6txJYpjvos9wiP1cDJ1kVlqxlvuXIY4ATTPbwjh+quzrZQl9S
	Z9axxDdTnbnYsxp83PchKW+42njTEa7DMSpjOc+t/LVdEjTaLQS8XmpVQV/dAIze0d6zgMXugW7
	OAhaSW0pmRaoaUtGjXbpwn5RGbES5E7Vv41wuMsvSR2r4kA==
X-Received: by 2002:a05:622a:a0b:b0:535:f8b3:a84a with SMTP id d75a77b69052e-535f8b3f361mr26044181cf.1.1791919225769;
        Tue, 13 Oct 2026 12:20:25 -0700 (PDT)
X-Received: by 2002:a05:622a:a0b:b0:535:f8b3:a84a with SMTP id d75a77b69052e-535f8b3f361mr26043721cf.1.1791919225113;
        Tue, 13 Oct 2026 12:20:25 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-177-43.net.columbia.edu. [128.59.177.43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ba684f404sm10027916d6.31.2026.10.13.12.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:20:24 -0700 (PDT)
Message-ID: <81e07de2-ec8d-4ffb-bffd-44391ce9a2e3@columbia.edu>
Date: Tue, 13 Oct 2026 15:20:23 -0400
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] fuse: convert the readdir cache to use folios
To: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
        Joanne Koong <joannelkoong@gmail.com>
References: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
 <3dfb90b9-e1d6-4a0d-899f-5db3160cb31b@columbia.edu>
 <c298c696-d10e-494b-b048-186cdd3f360d@bsbernd.com>
 <5ff63ccc-3aba-4c4a-a289-48620f1ceffa@columbia.edu>
 <3b7a2fea-3fb9-42b6-aef2-d9770e3562d9@bsbernd.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <3b7a2fea-3fb9-42b6-aef2-d9770e3562d9@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfX0QGja0Bj5p4R
 wZJv98g7AJDrXSqRdfT/PhzO5J1aprv8lrXmm0DWUcjSgWCCgKMzq66dkt6F4Dbf6+DHL4dan95
 FZ+CBb41hJYSFLGZ39ZnSxm0cVCYL595zwUDWispjIQAF0w4a1s76TWxh+/KoGMQI/PBSnSvsc7
 dcFOXy+Kidmwymmn2AFaDMNpUutL27fdatTTpFEBuOcFxxjBKqGhpVY74WxeRt3Uc0nrhxz0PPJ
 1Q0L2W9nyur0uMc4sqglFWTyuzc4SQRCzwhdSm6kidNrfry/kruJWFvccWoYvpx2IQTa0l+Tmgw
 MRPVrYuJG60uHPc1faGw+z4QUjbD2PxBIy7UWnSFppUypcGOjcrBz3kgae4O9QQ5EJ4VY/sg0C6
 qf8B1xEeZ3OhofwzcKoN/Z6gq36Fn+VPhoy5mT8ci+Lsc2khfPb4uUg9nrgLsp7mD4hVRHo1sAy
 ejOwDBW9RWNBbZ9tWew==
X-Authority-Analysis: v=2.4 cv=TIrQ2Fla c=1 sm=1 tr=0 ts=6ace847a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=lXeS3XHMKYhu4Q0xF1pUDQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=uWY_cRABlmrOhBJZ42EA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: jea2pyeYpfw2-UJ6ca_aS2wFe1IotGeS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfXxnpRu+YhLRA0
 H23kiHx9h/3G5CkooB0886zQ7JsmJRxMMdcqzjng5TujZxQjkP55dcK7gGN+YdAVHGgAIPkwBMQ
 Q5tHRqa9M3uGJSv9JMg/tgzfFwgeOtNYO/10jX+7wYPtXomeRLXE
X-Proofpoint-ORIG-GUID: jea2pyeYpfw2-UJ6ca_aS2wFe1IotGeS
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11934
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=10 bulkscore=10 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130077

On 10/13/26 2:13 PM, Bernd Schubert wrote:
> On 10/13/26 19:49, Tal Zussman wrote:
>> On 10/13/26 1:38 PM, Bernd Schubert wrote:
>>> On 10/13/26 18:48, Tal Zussman wrote:
>>>> On 9/24/26 7:42 PM, Tal Zussman wrote:
>>>>> Convert the readdir cache lookups in fs/fuse/readdir.c to folios. This
>>>>> removes the last caller of find_get_page_flags() and one of the last
>>>>> callers of find_lock_page().
>>>>>
>>>>> Based on fuse/for-next.
>>>>>
>>>>
>>>> Hi,
>>>>
>>>> Following up on this. It'd be great to get this in as it would allow us
>>>> to remove find_get_page_flags() and find_lock_page() next cycle.
>>>
>>>
>>> fuse has large folios enabled now - the patches need to handle that.
>>> Even if it would not be enabled yet, Joanne had spend quite some effort
>>> to enable large folios, any change that tried to rely on behavior would
>>> have just increased her burden...
>>>
>> Hi Bernd,
>> 
>> As far as I can see, Joanne's patches enable large folios for regular files.
>> Here we operate on directories, which are initialized through fuse_init_dir()
>> and so do not use large folios. In any case, these patches switch to using
>> the relevant folio helpers, which would get us closer to using large folios
>> in the readdir cache if that's eventually desired.
> 
> Hi Tal,
> 
> oops, sorry, I was bailing out when I read it as "this introduces
> another stop gap for large folios". I quickly scanned over it, but don't
> have much time right now - will review tomorrow morning.
> 
> 
> Sorry again,
> Bernd
> 

No problem, thanks!


