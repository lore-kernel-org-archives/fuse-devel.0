Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7DD3314AC
	for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786653769; cv=none; b=NN+vJDVG2oXUX/QtAgQIZnnm4oj0YNG4NYXACV2BWmMQSbMI26FHAG0h6Wh/q2PchFUjGBBVjKZcvdfbkKeiOIwI4azcbvs4iJZo9Q680dATm1GWgvA1EchQ9i6Y/wkFXOMEGASIHMHl4uPjHaiczdie96HOxJzYulgIj8YEnwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786653769; c=relaxed/simple;
	bh=zvXWKLP5EAA3Yo98R+MOiPd8cIVVvgwnetVIzsjWxG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LnPZZGqDj9tp9JmIXoT8MwZF4N0naKsA2WqgmqKu+25j5CFQiYQre/sRAZLgmDxBof6mTasCU/tIVFCU6NTOOztRoqtUet68UM1LeY2ZQ6lshTRF+rtWNun2ZCmZgbIcW4A2L0rCC9a5PMIVWzeeGuNRl91s3RQh9wEx+qD2c6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=k+taWILi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Kgdep5hM; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="k+taWILi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Kgdep5hM"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C4F997A0287;
	Thu, 13 Aug 2026 16:42:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 13 Aug 2026 16:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786653766;
	 x=1786740166; bh=Xj4bEIuFefAKXObiy2MNc2ZfNKIA08J+l7ofTA4OyGg=; b=
	k+taWILiY1++/XFwP/UybG6y57d8JOPDBucZiALDYL9f+kld6Ajz+Czedr6yu4cC
	vRCpzgcCbU4+Ye6LuBJh8EaAPJsaxmgKVAbZicqOBxh5Tmjo3sMEfIFvvS68qpWM
	68fjY21vcfPFASfyqvAVktWe3UvwDoyk9ozFJzjvJpCOWpOro12i5fSROXhFsl0L
	l50sSvkUqEbGyWyDb8a2bFoZtZU1fwCz8ZMJJYTOlLQHfw12iIrnYb8ngEp8QBnA
	1wrXi0bzYlW1LcHIMKlM5fnVN7rqSRSEQcXOtcagUOSajxowpvHGj92FKdHeWUIp
	n+Htxyp2MNMN+yyo6lEP+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786653766; x=
	1786740166; bh=Xj4bEIuFefAKXObiy2MNc2ZfNKIA08J+l7ofTA4OyGg=; b=K
	gdep5hM9xXpo+k7mjHgXCqefOlXROMkvk0Je8mFFnYUXNXfaD3GF8AY9SQmDPZzs
	TVF1QnT06UcC4dfpNvBx5Astgeh0YtloCZRywU6g0SS3S9YxWe/5rHCt5b8a0sws
	iir8OIJVOygr5KICWU0ZYTvOM/mkZJhnk5uJAWqJ9tle+BMEkJfy3N03Qx/NM7Fg
	7u6gi8MnskWcR0NilCrofVPjk9fs5/Nav8hkG01Q3ghoeS8/SqkOLKwitYW9ubtR
	cRWbR9M2ajY103k5A9xdCoI2AMIM1F8hqXDR93txY2wIDCq+5Itwqb5duZ3FCixM
	BQhuhvm44QpkXVcdPXf4w==
X-ME-Sender: <xms:RSx-aqLq2BoY8i9F5pmycDdSLJ5qh2SbJKlfUPrQ-NngmxuZ1GkyqQ>
    <xme:RSx-ai3hMKktHOQKWY9ueePgzNhdmkCIo8PNYs7CbLlqJVsekgrd9hvlvb7yEljmo
    Vti4MHpXheDu8afR8IT3LZZy77FNdvkynaf2QKbVnwfg9tiWpEh>
X-ME-Received: <xmr:RSx-ao4iT9cx7PsYd-S0ynE2v_72IOMcM_Hk6SUEYbmuwg7CUOHSVfbt2BQQfeSLIzu-UsKn_ucCUdy96iLJivuZbAZRr5q9awTc3Dff7xJSE64PRbh8xYlk>
X-ME-Proxy-Cause: dmFkZTEeJWCPA/JkDRFPUA6D5kGD/n009ObMt1ACJPxayvQoF7ITQ1C4kT5UPAtGscLj+X
    iq048Z/+k1BzJTsWCcyG9sYTJEL97ol8Z9U5/ohFsGQyeTOGBUXJynzzPzYVhP+kNmcM7u
    DxQBBBSQjrOAuK7/vhjEVT+EE1N8fPN8SZDjZ1Us3IFgs0THSmaZj8sMqeHB4GB+9I4JYK
    aLrReJJtYP0Kt0dR7g2OvxW1ik2KYRmsYMe5XnrNDcBXBUGe5HVmuil2QLcr9Mdu7D3N1C
    KH0RxAIaB1W2LNJbkBhsxscHBG/yvJsP32NHq+ZhoQnACbs1ivfAG1R8kp9CdqOnJrWLZM
    kIP0tqFu9CyoGvNdsrShjsvtrZx8uXruwY3/3hyLFYyiReyYTiaD9y3F8We6B3IcftSnlx
    viF5xyNAsswBZfSZlkHEfArXVkcukM3d+ROgYpuSpqEOZxnAlUoGaec/z+DM92ya7yHUnB
    kADNk/ljiuWBb7NOegO/ErKEjhLC56jIHUIroS1oY9tgwYpCSPyXfR3jPwk9RYQltlewmG
    KKMgfqhbHhCxUejaVb4Ylsa1VhZV2T8Q94MAaCD2o10JusyVPh7/xaMG0oVmzeNwAN+7oI
    HZHSlwhx9MskcKPKTuNcQ3lTiV+okkWDV+GRvxOAjfI5TxtCfa1SRjDwmh8g
X-ME-Proxy: <xmx:RSx-aj-q8hahkgk3BgETaLLIWsrSOq-MCU3tcju09_kKAwnoQGv4mg>
    <xmx:RSx-anVyNdK3hhj6GVdslV44bxqAhzkXnkxCwAlPoPoAWx4sT2VYBQ>
    <xmx:RSx-aurU2w3C8ocl6iOg8gUagPFDFG7nuqHkIJZf49eiO_yX6ve_mQ>
    <xmx:RSx-apmhKC_hpFlRAEeTfy1eCr0499WlsQTNRMFLT0Ku5-UqJOj5Fw>
    <xmx:Rix-an57u7F7uEvvLsWaOQgzgF8CyKz8Jug14q98tUQy5hPU3Pusd-gM>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 16:42:43 -0400 (EDT)
Message-ID: <4484d6f7-652b-4c7e-af49-6972753d133e@bsbernd.com>
Date: Thu, 13 Aug 2026 22:42:41 +0200
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
 <d8ead20f-91b6-49d6-95f5-f54dd76a411d@bsbernd.com>
 <CAJnrk1Yw7Pf96GQpguY3HjzfTn47r+O8KGWQZJmuikC5aAGP7Q@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1Yw7Pf96GQpguY3HjzfTn47r+O8KGWQZJmuikC5aAGP7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/13/26 20:09, Joanne Koong wrote:
> On Thu, Aug 13, 2026 at 10:01 AM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>>
>>
>> On 8/13/26 01:19, Joanne Koong wrote:
>>> On Wed, Aug 12, 2026 at 3:30 PM Bernd Schubert <bernd@bsbernd.com> wrote:
>>>>
>>>>> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
>>>>> index d50792162d8b..3d1910a9db52 100644
>>>>> --- a/fs/fuse/dev.c
>>>>> +++ b/fs/fuse/dev.c
>>>>> @@ -1247,11 +1247,20 @@ int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
>>>>>
>>>>> @@ -746,6 +786,62 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
>>>>>       return err;
>>>>>  }
>>>>>
>>>>> +static void fuse_zero_copy_release(void *priv)
>>>>> +{
>>>>> +     struct fuse_zero_copy_bvs *zc_bvs = priv;
>>>>> +     unsigned int i;
>>>>> +
>>>>> +     for (i = 0; i < zc_bvs->nr_bvs; i++)
>>>>> +             folio_put(page_folio(zc_bvs->bvs[i].bv_page));
>>>>> +
>>>>> +     kfree(zc_bvs);
>>>>
>>>> kvfree (see below)?
>>>>
>>>>> +}
>>>>> +
>>>>> +static int fuse_uring_set_up_zero_copy(struct fuse_ring_ent *ent,
>>>>> +                                    struct fuse_req *req,
>>>>> +                                    unsigned int issue_flags)
>>>>> +{
>>>>> +     struct fuse_args_pages *ap;
>>>>> +     int err, i, ddir = 0;
>>>>> +     struct fuse_zero_copy_bvs *zc_bvs;
>>>>> +     struct bio_vec *bvs;
>>>>> +
>>>>> +     /* out_pages indicates a read, in_pages indicates a write */
>>>>> +     if (req->args->out_pages)
>>>>> +             ddir |= IO_BUF_DEST;
>>>>> +     if (req->args->in_pages)
>>>>> +             ddir |= IO_BUF_SOURCE;
>>>>> +
>>>>> +     ap = container_of(req->args, typeof(*ap), args);
>>>>> +
>>>>> +     zc_bvs = kmalloc(struct_size(zc_bvs, bvs, ap->num_folios),
>>>>> +                      GFP_KERNEL_ACCOUNT);
>>>>
>>>> Assuming one folio per page and 1MB max_nr_pages:
>>>>
>>>> struct_size(zc_bvs, bvs, n) == 8 + 16 * 256 = 4104
>>>>
>>>> Shouldn't this be kvmalloc()?
>>>
>>> I'm not sure what the upper limit is for a kmalloc, but I'll change
>>> this to kvmalloc().
>>
>>
>> As far as I know kmalloc will allocate continuos pages and might fail
>> under fragmentation if more than a page is needed. I'm not entirely sure
>> if kvmalloc for such a small allocation will actually do the job.
>> How about the attached patch? And with that maybe we should limit
>> max_nr_pages to 256 for ZC?
> 
> I think kvmalloc should be fine. For size > PAGE_SIZE it tries kmalloc
> first and has a fallback to vmalloc. For small allocations, kvmalloc
> is just plain kmalloc.

I think the patch I had attached is more elegant, but we can do that any
time later. I just found kvmalloc_flex, I guess that would be most suitable.

Thanks,
Bernd
