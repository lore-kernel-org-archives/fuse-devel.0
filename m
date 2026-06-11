Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F514D90C9
	for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203632; cv=none; b=sbph15Id1Dx7BmgzUg+q2O0OhoioYcLoTeOiB4Sfz1H90WgqBCbDGHmp1LsZpgyrY/j6tcentjZZL5+Ij1k8nJiXpMK/rT8MjT0On9nMpKjYavreG0EZl8uVcJL6oDHvcUmmQMkqxUyXlAJbKMuEt2+1gMBAbWUPKgFj5HbsjNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203632; c=relaxed/simple;
	bh=MvW//e8oEENjHqIIhQeVjaIGReSZMLtObZ5flrPrI4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0+fFCefr6uMklSqRTFljDzpRlZ9gg9pYSI5EwKOFYlSh9VvpLu/kCSFcFaBzqkZ++7Q5IC6sQwLBxjBiU2bjpx0D3bbFk37bwEXmuR4lBgMLOq9NDpVQ93lSg00s1AOZaGNqEa51/9fF5E/4+IkUTGM02ilh8xO9puGgAQx/no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=HDEzRzlY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AHVHje+1; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="HDEzRzlY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AHVHje+1"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E22EB7A00D3;
	Thu, 11 Jun 2026 14:47:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 11 Jun 2026 14:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1781203629;
	 x=1781290029; bh=e3xfThsQHpMluLj2WYGwq4whONtQxS5U4n3ZNfZvbkA=; b=
	HDEzRzlYawf3fIPMCVSNME0NhiGnNQ1r9QJsIViTbj91f4iO2GlNRs/9z8XZ5MR5
	bbCL3XZZMtAOxKvi7Kv6nCqr6PsjH09t2Qok8kem4VG0G8MILWN+vjH7y1GBNJJb
	K7lrNPj9p9WvULb7c427S0UpJMPxEOsqAbmiEuwIQfsVLu6ThDjbysSvN4MwquT4
	UfNdSSDl+mRs9pz5MvYokbeyXBN/wojv4breKaEHOgKycKr071Iwt8S1S7sKNTZk
	A0I+8b96d03IhOWEm8fCx0vL+n7nfH6lSnzhk5L+ec4F67q6LjQToxIuA/Mx7ou5
	Hma0meIxiHBJvuvXjYdMcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781203629; x=
	1781290029; bh=e3xfThsQHpMluLj2WYGwq4whONtQxS5U4n3ZNfZvbkA=; b=A
	HVHje+1/TbOuHCZSME1g8k2CRwDWYWjjcKf5cfpy6cpOo6NnztrPcSjjAU75pgSP
	6mYV+P8wUvotmN5vy5QztFuhD/IyXLRtHh+UKaO0aQzFL10VzesAcwvtwIUSRmNN
	zVgxObTsDojqe2EX/Hxpt/K5JF+sQGHhg9h4IGSWQkrnmR1j+NFcXjjxwOsa5gMi
	aPyDc/aHJE8C5gFLuPVHFNWzXgwcxDIM2oX4Ju1hfyhbowPJwWmOVSbty2XOv7sS
	L0AH1TC0lU7gxGukHBEg+YHdm85wI/rhlVDvl0bQzvBUVOjWhpFdhNfi0ORg7Nle
	3WuVo73e5K1Ux4AZFXJJA==
X-ME-Sender: <xms:rQIragnT3TcG_MGInQ2f0Ll0F24Vk7Ef8ZCEVcszjlHUl808DA7IJA>
    <xme:rQIramvXhYrxdXNP9LE8tcbfSCbwRtKqCXhUIit8GJfCrvhG_N1Kh0k3BnjUSZYY3
    dKbnpJHgbG3PrVIAFb8e9ofPZdwR5NB6xYvJ3L-3icbCvDzpt08>
X-ME-Received: <xmr:rQIram9tPT6qGZko2o7fo2J6rbDkgoayEft4zTRG0H0Gp4_SbISW7CyChnGujDAoEWGGMPXg1JUKqe2XLDD2zLmgpSd5p2VG61CLJZtf5OFHa0oOOw>
X-ME-Proxy-Cause: dmFkZTEWdWgDIE0r2kBTcSw6a9kMbRqxrC5xOTdS7CRzWhokDiHY05VZObop9BaYwxjOr2
    by79ywSuta59urMJ3YTtrdlY9bnGf8XCboZ1dH8e4KAp6Os7Sx8frh+GPrP+bpifeN7Sg3
    0JzBeKwdAIHyY5LAaHZjTH+vyel00ge8xSuP0+bVGA5VR8i6IKVJWwrjP3V4bHmay3Hmuv
    1I81FUt4eyDupA8UtjDLBCJEaA+pZWGwDQ90auZXmD+aQTiyhuYKrmIkVqknQDsSXOf8zU
    ORunfTrV3GSF4F7abohcrWDXNxGePfKte8rOphcng8l/2h3SY3OmH/B6X5YHldvyMlutTr
    267wbCQ8Nvu1nes89b99AXeB4gAEvvi8YSA9fdpAz03VWuFpVuoENN3Eq2tpt3vRXjABMp
    oG6GwE1OhiFG5AFmLSGq3q5wa5WVWgvwRreEmjfpj6kc1O+WA5sXj9B6T96KblC2TEchyY
    hOKnsmkAXT+KWGq1CJz7jHIVGDJ5Pi3pDaAJlbrkODUSyME2sz5QHqJKHwrlL7ChwCP20M
    nraJFJailOk/HtyklltHp9cPLr8KkEhftmhr6jRi793440wY7BVQS2wYPAmVdbh44Avd7E
    EfLo47NUyRBBD8wV+lulKJ0SFCAJjwdJ5ATjWNbz429L9/PwcbRLfFxCVe3w
X-ME-Proxy: <xmx:rQIraoN8blpR_2rRGdGCNHcFzkXpXvG0ngGUT41cfOFHUVpWwlNIdg>
    <xmx:rQIrasFywlxJd4B4B6QCiE3p46myrU_UU7PJtzNI-OAe2GJLezVNWg>
    <xmx:rQIrauSbzF08R4cnk8_RTNJ6JunCgO_RzNFBFeoi2oJRclxc09FG7w>
    <xmx:rQIrahuAlohzm8f3DmV-S_veELt2U9lfjqjcIFkmXRUU-Mpdm5k_yg>
    <xmx:rQIravOSziVcOzGWYyHefhjE-NeJubI9wBEaZI_o6ByLAmvgnJkVYUwv>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 14:47:08 -0400 (EDT)
Message-ID: <796c1e91-41aa-4c1e-8013-db0dc7d55da7@bsbernd.com>
Date: Thu, 11 Jun 2026 20:47:06 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: jlayton@kernel.org, axboe@kernel.dk, fuse-devel@lists.linux.dev
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
 <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com>
 <CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTDkCigNKRt57JREJQ@mail.gmail.com>
 <6ecc45f5-4bce-4af2-bfe4-36c69e624b01@bsbernd.com>
 <CAJnrk1aS=3KwZ3LpiqcK=gKsj7oru-k-1Xpe2j5puDdmn+hjUA@mail.gmail.com>
 <CAJnrk1aacCbOWWWvW2xnQZ0a954-4shXdyO9LBn_Fv_dyUAWnw@mail.gmail.com>
 <CAJfpegtorFv9u2NCPA8v5OHiBUNT-XzUiw_y=7c3U3WEaXRUZA@mail.gmail.com>
 <CAJnrk1arYPY1u8_aiMfYUbmb9Oy4epRWJp_W7-hjAxQ_ggJn9w@mail.gmail.com>
 <CAJfpegs7ttuzD14cnEeRBeDnw2E-5Dz=+xCEWVDRCKqMhDZ62A@mail.gmail.com>
 <CAJnrk1ZbThfvHBfVq_SntuRLFsvHC=DMBQnNcS7Zu4MV9YXTgQ@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1ZbThfvHBfVq_SntuRLFsvHC=DMBQnNcS7Zu4MV9YXTgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/11/26 17:24, Joanne Koong wrote:
> On Thu, Jun 11, 2026 at 6:29 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>
>> On Thu, 11 Jun 2026 at 03:51, Joanne Koong <joannelkoong@gmail.com> wrote:
>>
>>> a) I don't see a compelling use case for needing to dynamically
>>> add/remove individual buffers from an existing pool. If the server
>>> needs more or less capacity, adding/removing a whole pool or queue
>>> seems more practical. If we do eventually need single-buffer additions
>>> to an existing pool, that can still be layered on to contiguous pools
>>> (but removing buffers can't).
>>
>> If server knows that it will want to remove individual buffers, it
>> will just have to register them as separate pools (containing a single
>> buffer), right?
>>
>> Buffer pools are a more generic concept, hence they come with some
>> extra complexity and overhead.   But the interface should be a
>> superset of what individual buffers provide.
>>
>> Am I missing something?
> 
> The interface is a superset. Internally the difference would be X
> bufpools with a single buffer vs 1 bufpool with X single buffers.
> There would be more overhead for X bufpools (eg allocating X
> fuse_bufpools structs, looking across more bufpools to find a free
> buffer). I don't think it would add much additional complexity, given
> that multi-bufpool support would also be needed if we wanted to
> accommodate different buffer sizes in the same ring.

Really sorry for late replies.

Couldn't we make a config SQE define a max array size and then every
array entry would be something like

struct buf_entry {
	char *payload;
	int buf_pool_idx; /* which buf pool */
	int idx; /* index within the buf pool */	
}


And then in fuse_uring_ent_in_out you would need to set buf_pool_idx and
buf_idx


Avoids which buf pool still has free entries, but buf pools get added to
that array, which then would have its own head and tail. Obviously you
would need to do another pointer lookup to get the actual payload.

Obviously has one more pointer than just a single buf ring.


Thanks,
Bernd
