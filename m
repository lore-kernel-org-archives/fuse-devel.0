Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813C952BE4C
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 17:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913755; cv=none; b=TodJO+9EN8h9VTGxvNSvb192ZYSA7JIwQ1zZpFdvbev29sNNa9pHuameT4xakhNiKkh3ezwXxZyL4rjSI471H0guET/LiHzl6EvBEwOadvKhlBf8qNvbedQlnBG9i06+of2UnHT836DrBypGnmiWt4zeIk+V7VYNIgiOXyKVDHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913755; c=relaxed/simple;
	bh=gt4OYb/2uGd62Fa4qtJHnBmBlHwiNXQvphYRF9TM9W4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AnWDfRRvslDlDi6Su+dP0znrEbdZGgL0v4r0IQ2AI8cwyQ/W8X82DH+VhbpzaxWzvSz7sh2+squDCrKGdKnEUM+qIEnTzVeBr8uovkhgUFtN6SkYmxv3SAoKGXx/mDKDwFxTQ0fawCBdb6IwoMDf7kwwK7x7aMjauCWu5bzVNeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=sMEVj/0y; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Qs9z6CP6; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="sMEVj/0y";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Qs9z6CP6"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DGYEi53890592
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 13:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=9I62
	VOX7B6MmAu1N/fosfEWYVH1Z+oaZOt7rTDsf4HM=; b=sMEVj/0y0bdOmWtdhZxy
	zeFU5p6uIyFsJnV07j6YacyiVL+D48SI3KP64knD6S62NVfFLmR3+iHibcxSKSBW
	TMGfrzE9+G+GLnQH4t0Sq+MZKubJLArWfo2tlxkXygSR85VrWj37XtG5zfaMcXLp
	xSPlLJyzykHKbWL4yQL7Nn6OviTi9427DsBEjnovFNDdQZS2B8ySB0kb8ULy/M1y
	ROoUz5wMdpu9CdPdId7txCJL4/Y53SKGX8lkgA3SWw55ubLU2MuRLMXZwOyBantT
	PouXx6iqQfhaXplxHyqweLVhdrl16tNCFRc05Ar7mn1HcrlBajSsm0AI18st2WO5
	Fw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h9q1c1gpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 13:49:12 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dd3c3badbso732347285a.2
        for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791913752; x=1792518552; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9I62VOX7B6MmAu1N/fosfEWYVH1Z+oaZOt7rTDsf4HM=;
        b=Qs9z6CP6Mye0osHY3aYMh8KSvlOSSQ+/IaFxk39mjZxCqpmk9Vx7Ix8NyrYyy/uqhm
         3wUICZB+pPXvlP00NvqgnCgyMVWtY2BDJ1OmWLRqLsC26+k/IlfoyS4n57P+wbV/Envl
         TXAb0Vf1y4l4gJZZRqzIWzeXzCtEFSz815aG5vMt4Xx93aWtmTjAYwBYfPLCbfmg6yUU
         RY8QG2T2moLDDfYSsshf2R8L7l5+qZdRbbeHs7bCXlMHIKAhfSEBUeEdW0Y9XjYWQC8l
         gPpGoxwFvgbP4ruOYaDw6cXEH7Cq/rBoZHfPK3WhW2r14VzrWi0PPYw1WZBPgD70SE+q
         UY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791913752; x=1792518552;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9I62VOX7B6MmAu1N/fosfEWYVH1Z+oaZOt7rTDsf4HM=;
        b=QRWcXB/HuQDptozTo8PBSdmovkv4EX/AX3YTB/A0lC6VfGC+YN/hAr4WkDM1wLMZuw
         nz7/lAOzJnX94eNVnEkxKY+ddyN01JgEY7EsffGdm9PwCbQXTrhZvfheiHrjhMdrMnMA
         hOOtmrt8xbeWoQIL8RZlahn4Klr9wBDuHy40xwrIyHPoSvxo6CfanPbsmVkO50r0arEI
         Ha9xguA3YrkEevr2GCkDI9anl4r5fppSKkATi9tcaWSJrdZx8cxgUtDl9p4wuWt66KjP
         f7LMygery+rgc45HSdYCyaanJK+IbZ/GdHcARF+tpyoywL4IAMa2J/g1LQ+FdIV3bypr
         VKoA==
X-Forwarded-Encrypted: i=1; AKwUvBxMe7AMrijCALAj+FManSYuAEkU2T41fBb5Oc1HfB+igVJNPhTEEZDZgK35hZUzeqUQQd3rpiN94/WR@lists.linux.dev
X-Gm-Message-State: AFq9FYI8zdRj5blcxgiJ3f15hUHLroUliNkqQmtSLIXvCoNTmgwEktW4
	qp7RqG78Pa39vb6Mw/vbClQV59s+8hmxZB+y4gtXgXH7wP8gxHW0CvkvHDW1L/nGYkbtStKZFSI
	Ea2SfZx2T4AABViD98DtbYSwx+ai37VC23bhInkM9eR8tA8U3KTJvf4h5sME=
X-Gm-Gg: AYBFou3+/fQ6PK5KPBK/Ohqa/U0O9s+tGgXrCYHIEuFW+aJIFPEriWENKDr5dsQl4RD
	MVEzcsvZleaGbPYTW7TH8TaM9BM+DpywNsPSmSOuxQjlHd4/YtQ7cPvcPpKp+jd0yCrDhSfP4rv
	Z0Mqv6Ie1Aa1h9p1qWGVnN3NeDwIz8FI9062eCnQU7mnZKEmsxBRGKSd4fLMUMv4JPY8tariR0D
	EN4N+u4Ui5WSnHP16Aj/vML4FzVbCxa+oRvvTwJIg+Pa5GGJrzAsmiSYz+/wvVWRQxUNHBBvbbb
	dsJud8H0z5f8r6IpucmpP/Y7LGxC+NGncPNnn982xF/Yx72WWT0OKah6GOSjp+WWvpZfioKq/JN
	iBGR5tE+ax36T1U/gP0/VSkQgYomN7TPxqCdz7hEbw1mLaA==
X-Received: by 2002:a05:620a:44c8:b0:939:1222:b9f1 with SMTP id af79cd13be357-93ebcd2b3d1mr2100873385a.0.1791913751549;
        Tue, 13 Oct 2026 10:49:11 -0700 (PDT)
X-Received: by 2002:a05:620a:44c8:b0:939:1222:b9f1 with SMTP id af79cd13be357-93ebcd2b3d1mr2100865585a.0.1791913750556;
        Tue, 13 Oct 2026 10:49:10 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-177-43.net.columbia.edu. [128.59.177.43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef4f49861sm294878185a.4.2026.10.13.10.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 10:49:10 -0700 (PDT)
Message-ID: <5ff63ccc-3aba-4c4a-a289-48620f1ceffa@columbia.edu>
Date: Tue, 13 Oct 2026 13:49:09 -0400
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
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <c298c696-d10e-494b-b048-186cdd3f360d@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R8GWitRX c=1 sm=1 tr=0 ts=6ace6f18 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=lXeS3XHMKYhu4Q0xF1pUDQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=YsdHqNpWnMdXCkS-BawA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3MCBTYWx0ZWRfXyE2441oTZ+9g
 C83hpmTSGUVzcQvRp+B2epqiwEJteMi7ooAuNEx1hjiHJ/dpvWrGgVeHMoWjcfcjPgUgLb0tAZs
 cPgLUCVqKSAbfI9PtSK7q22nIAj0Z2bWDxUazstqqd/JMXS/dOO3
X-Proofpoint-GUID: w6dGYcV0JpayNPQROKS0BkOa5zW-hjtJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3MCBTYWx0ZWRfXzHneI7sDwXnM
 C3iMoY/gzgt6nwpMV2kA75PHx3ih5k+kAkLMfs0FQVcOB5s+pFWG5lRNade0kSjSCLY2VTm6HbV
 uYAH8KSIh9cQtW7KeXPmvxPllcMN2B0e3lsiwMhoNcmbxMyMd/hjaq9ioves+61VzvixR42LWjU
 szf2UVRDhTcy7tJO3MoGGxHK0RoTsm22ouOrU0Wf7bMV/EaIPNOEXoLYVHxDmnoNh1+zE2q4w75
 w5Jjpv9eQ+sf/bqrzwyY0D6G+jsZwzBKweID0p/+n29yGYnGemeckM6oQR95FyYv/O9zNR2CXLv
 1O5mHSh+rIOMmqXWFfTBH05HoMTWn6iu4J4x2LOPNhSS5jq2kxQ4pij5IC8GRxuCX/80CZzA44T
 DejdmyicPLTkKAyEPpGt8hqNVU+zd8BWDHOJp6t1zIGnivrtAZFsMlyom8anxAhKLzyysYB+9Tg
 5w68t1mrNu+alnhvAjA==
X-Proofpoint-ORIG-GUID: w6dGYcV0JpayNPQROKS0BkOa5zW-hjtJ
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11934
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=10
 bulkscore=10 lowpriorityscore=10 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130070

On 10/13/26 1:38 PM, Bernd Schubert wrote:
> On 10/13/26 18:48, Tal Zussman wrote:
>> On 9/24/26 7:42 PM, Tal Zussman wrote:
>>> Convert the readdir cache lookups in fs/fuse/readdir.c to folios. This
>>> removes the last caller of find_get_page_flags() and one of the last
>>> callers of find_lock_page().
>>>
>>> Based on fuse/for-next.
>>>
>> 
>> Hi,
>> 
>> Following up on this. It'd be great to get this in as it would allow us
>> to remove find_get_page_flags() and find_lock_page() next cycle.
> 
> 
> fuse has large folios enabled now - the patches need to handle that.
> Even if it would not be enabled yet, Joanne had spend quite some effort
> to enable large folios, any change that tried to rely on behavior would
> have just increased her burden...
> 
Hi Bernd,

As far as I can see, Joanne's patches enable large folios for regular files.
Here we operate on directories, which are initialized through fuse_init_dir()
and so do not use large folios. In any case, these patches switch to using
the relevant folio helpers, which would get us closer to using large folios
in the readdir cache if that's eventually desired.

Thanks,
Tal
