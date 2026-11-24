Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550207;
	b=oNlk77XjNwHTjzC+Y2NmX4d4S5d7O1Gsq0bijxYV0zxTfthFRHzyoqCJfJIvrhfBG5Bi
	 ub1UmUmUKarxfJis5NbmH+QtcyNYMfYlBX2JYAMM/6T8VPMoD2C1FfM1gIf4XTKKMgiij
	 AspjK4I8uGR3SmOE2GicysKvOkq3CeJpsoskdCdVxqIrXA7KlATjYDs74PZpLPkjSxwe9
	 fCKcChuDmR9xwFKksBFgK9FQhoMgoPdITEuR6Ifb3wZgzdh+aK4F5q6EFtOkEIYKUVnlu
	 WdtBysXaOyR0LqeblXEok+CKZ5HH+y9gojJ7OdBbfZv4aHFe/f8bjtpao5K/GKjj9DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=28BWISp8CHh64wUoMPCkilCDeAPMLLl9qM0eqDnQdc4=;
	b=W2otR2qAUfJf1nmdl3CJAAb2k4vhea+FQxV/ds16NEzPv5mdWqTAUpbFpV7bIhRar40d
	 j/zzqhYIPKggs0u84tFv0UppSbRXPqwxcfzdCtyar+Ih1zqGOxv1RZacrUCPn2ZOWfWvC
	 gjBzb4nNxidZs2V5yhBR9+V9X1y8UslfdxJctoxxJ4U7t5+u+QUQYKQEODTPwOkUWJtg9
	 YPxJ6fus6cdGLnKOgNrMU1XuOEuOR1uzAZO0BYuRa/tIlT3arHgT5dNry/GA8a+CS+rWV
	 fNxLDZn/aIU1fxYKIGV43gQC3VGgMSEkj+AuvBbAXBHBWkORI8gN0dn4Uz3aatSS/zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=QB24+diW;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=sh5yGYU6;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAE3606A32D
	for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 19:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDAE3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=QB24+diW;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=sh5yGYU6
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJuEDT2905255
	for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 14:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=28BW
	ISp8CHh64wUoMPCkilCDeAPMLLl9qM0eqDnQdc4=; b=QB24+diW2EA5LGWoAmsf
	FM9ud+RnfLueJcLK65jG/B0btp/hcz7mLga/Q8INnC4KvtZtDn174VmJ2f0Coj4L
	kfkgdjpgbNI11qluLsZAYdeWL+u2PGe1nR6egZRLJkKwYFuDg9DeK3XT188ZHjI6
	knyMAvszf+0qy4weUtwzP5c4Zab/VB351qMnDpj1g0LmtOPruiGi4TQKsiGJ2Cwh
	8XuK3rLEQh/bfQ8/Q+PttUh9OxFdBIwtH7Sc6ovIGgedfSLmkHhZoBN+M8DhQGEb
	TgUurKwdbyY8ieePqUWcPVQXyiD2AVRx8iREpiRmc5QcE5m3TB9y8mngQwGVaTJU
	XQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j5gc4gev5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 14:56:40 -0500 (EST)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-537548d4bc0so117232641cf.2
        for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 11:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795550199; x=1796154999; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=28BWISp8CHh64wUoMPCkilCDeAPMLLl9qM0eqDnQdc4=;
        b=sh5yGYU6pss8WL/xWpNgTWYiCTQ4c73bcospTCKamNufdGLGV+l1eR2BaKtHwDFVeH
         HX9rDdHG48vbFZvf6fRnU7LxkXwKejP4q+PwGdWAX1M/F6Tfy3FC8QO7MF5EWx5am0ql
         SqSMwGtSOSNVOIsx1LkyvHfINrYr8Y7K5dMbEpcMPEdoqPwrZogpPJDkbuXCU4HAZD2n
         P0RYv74I/ClcQXDERvC6c0lo348iGyY2R/ncPAZj7llZ2bQEh7W758ZRAyE2yhqMg0U4
         BHIRfGTlSH6pAp3X2nGbAN1z57kWaqoP7xXEE0xWDbO+N5hmxd0fWS/koyCIdHI9yVh8
         IqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550199; x=1796154999;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=28BWISp8CHh64wUoMPCkilCDeAPMLLl9qM0eqDnQdc4=;
        b=OaUPR8eK4iiR6i/nOnMp7rjrIDGFsKFmfUYDxw3ngsE4LA3UBGBv0oIEY466NTuFuI
         UqoDdPiS3wTb3WXpqiFKT42rmNYhHhpqrDu734msPAYeJltuxhOdOGSmxqfcxgywUin2
         3Ze7pP0PhOONOV4ZvIE8ZCgqkJC9kc/PQoo3uqVXZtD/USy+anUH4C6FocYrZyRE17Zb
         e+PMI9jt1ih8bU1CV2x+mNLNDw3Ab/OcMcu0Mppv+4s0hGwGhqfkCCU+ex6yN09tv5Fm
         YpAYevpZSmKA9hNETE0j6q5nNx3dJrQEmsiq0ZTVKza2yHIXH6rWBxmJvM6p4aKffalj
         +0tA==
X-Gm-Message-State: APuU4Z+T3O86gpiuKVFhBAdIOEw0uPPHw+sJNPnKATc040bw/FVpa3c6
	9jMcg9lm9L1rKNtp1i3lwCzLbTjxLzl0wojVd2xbIzcuBGrdjpUr1MVaOvcexsnbmhf0j/Z3DWe
	6x1RyOJvqeA7iH7UlzMOgGwSJWUJ3mtJcfaCpsCkMQ6gokJc7RG065jofb8FHBP46d8I=
X-Gm-Gg: AZFdTZd4jzq1UtgZy0oENJ5lxOqgjViD+6AyVeaG20SXbgId2BCdJj0pINRL0FY3/aO
	pod6GINAJfvYLMIY7eGGKzIsRy+gZr0evzt8brP4QXJpK8oFYyhfnKM8cmjDVc2nnuQ4uChdRIE
	ARTb+MveiSH+yjGPy+cryVOb8EvMdMVxCK6Y2Zy6ljKTiVf9jbr9fGTd9I8spWuFRONAbIbsSxB
	3Z8sE+lx7lpYbLJZSknifdJZ1SBdWMo8WbWj3B0sCKGqRHXOXvPfQdUmXjw/Fw8i/cq/tuXEB76
	WrDWccMRN+c1E8UK2LIi/0vjNS0HkWNhddYTT4bAniIFpXI+wWgi3vK6xYWJ9BsOOH1xhlOlV/Y
	OW1jHEP5zAxnOVXUjgZfI+zB9le6QHxQtSnsNNFtLMarxF9RYT+zkycsVWyEkiKJrjg==
X-Received: by 2002:ac8:5c95:0:b0:55c:8dc9:401c with SMTP id d75a77b69052e-55d76ade97dmr308653181cf.70.1795550199017;
        Tue, 24 Nov 2026 11:56:39 -0800 (PST)
X-Received: by 2002:ac8:5c95:0:b0:55c:8dc9:401c with SMTP id d75a77b69052e-55d76ade97dmr308652211cf.70.1795550198449;
        Tue, 24 Nov 2026 11:56:38 -0800 (PST)
Received: from [10.206.101.158] ([129.236.231.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134796288sm141261236d6.6.2026.11.24.11.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:56:37 -0800 (PST)
Message-ID: <3aa54ca6-7095-42e4-8424-6bba00643632@columbia.edu>
Date: Tue, 24 Nov 2026 14:56:37 -0500
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fuse: pin user pages in fuse_copy_fill()
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev
References: <20261120-fuse-copy-fill-pin-v1-1-72a0d888f140@columbia.edu>
 <CAJfpegsDMb2i7gnO1ZAao4bAqUke6rF2TmvmxZj_pFxp_xv0Sw@mail.gmail.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <CAJfpegsDMb2i7gnO1ZAao4bAqUke6rF2TmvmxZj_pFxp_xv0Sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WTN_C_LAt31guXb_UgSt7SyDna4S9cU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX/ekaNdeTYvaO
 vBna0GTF44nJK+SoiabwEzngzzaRiRG62m9937yhegpFBccA5HjvLydJq5KMO1MzRO3gBy2pBY3
 JJeS9gMrqgxwJR/khPWbi/mryN1MGXfmspADp/fRtgOydtpbiMGM217PWT7Bjqif3Tj5pYl/CgX
 pUK1ly2XqTXnsKZKraB+uDEWzLLUyyWvDTzO7cY0Lp5/rUM9bUmsv46/F2TXmYcD7nd6ZlkM/ER
 wl15tFFDnt8/rJnsCi6OZNdda2Ne4DrCLoiEiWG0kxgkzi10ly21OkzHTpI9niTTd6N/HcSIeo0
 eobw3KteRek/uieXaB7/oPt6G5nyCGkrI8xRu1kDOZALghlvSM9dtzm048GrFseBxW9+ojO/bQp
 cD8R9/eP1mE+gRchEQDk2YX5W89we2N7fiVSFwfeBHoUlbg0w5mIaZOUHFnh2usFY7En0e04h7C
 FptFM6cEscPUgVL8P9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX6Tyrw4+MfIeC
 DHEdQ6ww5yjOtZDcXbXht3QvR3/DIT8Ccu7Red2ZfqeYQFXTgM1jeGR2ds5wLGxZaONqiexdTRY
 dhtJwOtSlalNYfK+ATbmOJlo1+symlCTJBLCB8paoCJAmIbcLHMZ
X-Authority-Analysis: v=2.4 cv=P76vFSAu c=1 sm=1 tr=0 ts=6b05ebf8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=LNQXEAmb7IHcZyFqmLK0PA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=yH8cqKNTATvEbLOQkxAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: WTN_C_LAt31guXb_UgSt7SyDna4S9cU2
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11976
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=10 impostorscore=10
 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=10 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

On 11/20/26 3:12 PM, Miklos Szeredi wrote:
> On Fri, 20 Nov 2026 at 20:05, Tal Zussman <tz2294@columbia.edu> wrote:
> 
>> Use iov_iter_extract_pages() instead, which pins the pages of
>> user-backed iterators and takes no reference on the pages of other
>> iterators. Release a pinned page with unpin_user_pages_dirty_lock().
> 
> Can this have any performance impact?
> 

It has a small impact in a microbenchmark, but within noise on a real
server.

First, with a trivial libfuse server that does no I/O at all, so the
kernel's copy is the only work done:

                  before      after
  4K writes       273 MB/s    285 MB/s   (+4%)
  1M writes       8.8 GB/s    8.9 GB/s   (+1%)
  4K reads        282 MB/s    290 MB/s   (+2.5%)
  1M reads        9.1 GB/s    8.6 GB/s   (-5%)

A pin is about the same as a reference, plus a couple of counter updates.
Writes get a little better since unpin_user_pages_dirty_lock() doesn't
take the folio lock when the folio is already dirty, unlike
set_page_dirty_lock(). There's no benefit for reads to offset the counters,
hence the -5%.

With a real server (libfuse's passthrough_hp --nocache over tmpfs with
fio direct I/O):

                  before      after
  4K writes       213 MB/s    215 MB/s   (+1%)
  1M writes       2.8 GB/s    2.8 GB/s   (+0.6%)
  4K reads        125 MB/s    126 MB/s   (+1%)
  1M reads        4.5 GB/s    4.4 GB/s   (-1.5%)

Thanks,
Tal
