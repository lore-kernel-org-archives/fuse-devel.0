Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE42E3EF649
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 22:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778884078; cv=none; b=g5trQSCNLSFSB2A71nXu8+XciHr/8HtMkcyo+EaNqN6OygE7euyi6mfhlucddJuD/TfJ8L7K5HlBHq5P2/f9R/u1sGSXC6kO4Gq8i+b7X369ssfl0K208HRA5zXCFl6B/zEYzv2fdfAQRcirAcGAqA7GoC3kb1sACoqO6WIkKFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778884078; c=relaxed/simple;
	bh=TR1wjU7nZtPqcmWoTNaI2Rl8EEuNfs8CmEGTcXnn/Bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ABT4lGiCaifX32GcIQa1VKBWwADc17RQENBP5ekD8BU5sQ+DMwlmNmrlf+xjEy99330N0Gy+WJfU3WdmtSHpS5zN5pAYTBlODPh/Io7bIAdQajCFeO9KYi3rKlr0WcdaaxQmEYt0woHd6WUPB7YaKVhaz3PwwGEatib6rPUgMbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=DQ04TUIi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gojetiRr; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="DQ04TUIi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gojetiRr"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1C2131400093;
	Fri, 15 May 2026 18:27:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 15 May 2026 18:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778884076;
	 x=1778970476; bh=tFhOaEmyH1PsnNBRzkV4gzt+fR9ihLIFC/kN/iDYh0Y=; b=
	DQ04TUIiezmgVSZ6PIkixaauSPy0D5xiknNX1SasWl/BSaGySmRebxy35j2rzPF9
	kyIWwOaUiYBBtg95yLikcWQcEdy4L/rskv0jnn4u+YoH55vgQRADNICgbdpffW2u
	7jOa5Ys2pOIY+jHWPFFNGdNN2QZdfE0vQrMG3GN3K3Yg8KX2A4aV2rHVc70k1Z3r
	oRjJ8kjymQ/obywKLF83fJ6zmKZonbLO2EIVAc8P8CesMHLpZ9GXbjZNqLVHAA8B
	CfS6DmqntUsZ9SrStTkN8lHzQ0FxJseoJOxJ8SgGyLh9URxASW9ngHz4yqPmDAbp
	/TnUqrJein3rYbNiGcwq3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778884076; x=
	1778970476; bh=tFhOaEmyH1PsnNBRzkV4gzt+fR9ihLIFC/kN/iDYh0Y=; b=g
	ojetiRrOhDzLmBU1bZJ/TjxoPvtnZ0rBhtoxahNaWHacUi9/CKPxe844OXzYprFy
	U2H4p9PyZmCno09dcWWENBiDp4F10iY0tFaGEsoitlMXlPsdtC56IuKEjirBt+fT
	mAtuXGBg8msdC8ZZ/8RATqI4dknOWip7TwJt6sEiOSM5bbsJVuxMWICSWPE84qGH
	j4RsAiY/v5qyWSVDv1cZY3549LSL356u9e69YQEj2jPTRguqGYVJNynJmg+fz50D
	iJoFu73ACtMzKh4Ee/Ja9mB7SkDZurMj7SFVgGEuYexUEx2AD6Amb5lD5dHYdyDa
	wCe4FaC5fkxVErKpzShJg==
X-ME-Sender: <xms:650HajqGZ28EeyT4aXhH5_JUzJRAGTxgmHf8aQ5Sei9HlLipF9Xwkg>
    <xme:650HauWw0wkT01lZO1NHG8FLF3deaFOzNlOZpq8R1ri9TpW7FZkXOybt7SL_Pskq-
    mTNjNT0I94DxX5QMZror-6Rn3cVu14-qgYK7XS0DbnByaBFFvAG>
X-ME-Received: <xmr:650Haubj4FCl6O1SW-USZMtCPFweYrzHs07df-dsNnMrfO4bDtalFX873YTkb67FPiwPfWToY13eyHy-nj3US4YPrZQl-t3JxGKMNtoU8YwrbUWu3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeduiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeeuvghrnhgu
    ucfutghhuhgsvghrthcuoegsvghrnhgusegsshgsvghrnhgurdgtohhmqeenucggtffrrg
    htthgvrhhnpeefgeegfeffkeduudelfeehleelhefgffehudejvdfgteevvddtfeeiheef
    lefgvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsvghrnhgusegsshgsvghrnhgurdgtohhmpdhnsggprhgtphhtthhopeejpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehjohgrnhhnvghlkhhoohhnghesghhmrghilhdrtg
    homhdprhgtphhtthhopehmihhklhhoshesshiivghrvgguihdrhhhupdhrtghpthhtohep
    fhhushgvqdguvghvvghlsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprg
    hlihesuggunhdrtghomhdprhgtphhtthhopehhohhrshhtsegsihhrthhhvghlmhgvrhdr
    uggvpdhrtghpthhtohepghhgrghnjhhiuddusehnrghvvghrrdgtohhmpdhrtghpthhtoh
    epshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:650HarcM11oSL7ICBN3haNARtLRbd2ePDo4jbDcaaBAcAkL9wAvO6A>
    <xmx:650Hao0vi8FNTmMD23_Rzi0hBy5cA3jkKnxdCT_zlgDMTShgQBavpA>
    <xmx:650HaiLoYB_Wd-NTem6hO4wESOvRGVS-wTNBbD77leeb2vXFv05trQ>
    <xmx:650HanEgtnvoG2RDdNnP8xpqg-863SB0N1HDqGyIwMqy8XmhrCYWwQ>
    <xmx:7J0HarD6AWEodHWQQp0M-cOy4DQ6v4dVRp4gI_X-VCoZfEDL58a8VgL8>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 May 2026 18:27:54 -0400 (EDT)
Message-ID: <b27136ac-ce1d-46b9-99d5-7d4cd110c929@bsbernd.com>
Date: Sat, 16 May 2026 00:27:52 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] fuse: fix moving cancelled entry to
 ent_in_userspace list
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, ali@ddn.com,
 horst@birthelmer.de, Heechan Kang <gganji11@naver.com>,
 stable@vger.kernel.org
References: <20260515045541.1171335-1-joannelkoong@gmail.com>
 <20260515045541.1171335-4-joannelkoong@gmail.com>
 <5c010e24-b4f7-481a-97e8-00da0aec6f3c@bsbernd.com>
 <CAJnrk1bY-2_6biL2dzsu8CLW_daYfpBM=sGxGRXOxj5qvOTFGw@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1bY-2_6biL2dzsu8CLW_daYfpBM=sGxGRXOxj5qvOTFGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/15/26 23:11, Joanne Koong wrote:
> On Fri, May 15, 2026 at 4:10 AM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>>
>> On 5/15/26 06:55, Joanne Koong wrote:
>>> fuse_uring_cancel() moves entries that are available (these have no reqs
>>> attached) to the ent_in_userspace list. ent_list_request_expired()
>>> checks the first entry on ent_in_userspace and dereferences
>>> ent->fuse_req unconditionally, which will crash on a cancelled entry
>>> that was moved to this list.
>>>
>>> Fix this by freeing the entry and dropping queue_refs directly in
>>> fuse_uring_cancel(). This is safe because cancel is the cancel handler
>>> itself - after io_uring_cmd_done(), no more cancels will be dispatched
>>> for this command, and teardown serializes with cancel via queue->lock.
>>>
>>> Since cancel now decrements queue_refs, fuse_uring_abort() must no
>>> longer gate fuse_uring_abort_end_requests() on queue_refs > 0, as
>>> cancelled entries may have already dropped queue_refs while requests are
>>> still queued. Remove the gate so abort always flushes requests and stops
>>> queues.
>>>
>>> Reported-by: Heechan Kang <gganji11@naver.com>
>>> Fixes: 4fea593e625c ("fuse: optimize over-io-uring request expiration check")
>>> Cc: stable@vger.kernel.org
>>> Co-developed-by: Jian Huang Li <ali@ddn.com>
>>> Co-developed-by: Horst Birthelmer <horst@birthelmer.de>
>>> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
>>> ---
>>>  fs/fuse/dev_uring.c   | 6 ++++--
>>>  fs/fuse/dev_uring_i.h | 6 +++---
>>>  2 files changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
>>> index d9108b5b5db8..f4ba64a1796a 100644
>>> --- a/fs/fuse/dev_uring.c
>>> +++ b/fs/fuse/dev_uring.c
>>> @@ -511,8 +511,7 @@ static void fuse_uring_cancel(struct io_uring_cmd *cmd,
>>>       queue = ent->queue;
>>>       spin_lock(&queue->lock);
>>>       if (ent->state == FRRS_AVAILABLE) {
>>> -             ent->state = FRRS_USERSPACE;
>>> -             list_move_tail(&ent->list, &queue->ent_in_userspace);
>>> +             list_del_init(&ent->list);
>>>               need_cmd_done = true;
>>>               ent->cmd = NULL;
>>>       }
>>> @@ -521,6 +520,9 @@ static void fuse_uring_cancel(struct io_uring_cmd *cmd,
>>>       if (need_cmd_done) {
>>>               /* no queue lock to avoid lock order issues */
>>>               io_uring_cmd_done(cmd, -ENOTCONN, issue_flags);
>>> +             kfree(ent);
>>> +             if (atomic_dec_and_test(&queue->ring->queue_refs))
>>> +                     wake_up_all(&queue->ring->stop_waitq);
>>>       }
>>>  }
>>
>> Hmm, ok, I had done that via fuse_uring_entry_teardown(), but this way
>> is also fine.
>>
>> While thinking about it over night, I wonder if we should abort the
>> connection here. Calls for fuse_uring_cancel() / IO_URING_F_CANCEL
>> happen when
>>
>> a) The daemon dies - that is what I had written the function for
>> b) When one calls
>>
>> With reduced rings queues we would actually need to have per queue refs
>> and if a single queue reaches 0, it would need to re-calculate the
>> queue. In general this gets complex and from my point of view, if
>> fuse-server wants to re-initialize queues, fuse-server should:
>>
>> a) wake up the ring thread with an eventfd (libfuse already has that)
>> b) we need a reconfig SQE (like FUSE_IO_URING_CMD_RECONFIG) that
>> requests to re-configure things
>>
>> Right now that is all not supported, from my point of view we should
>> call fuse_abort_conn() when we call into fuse_uring_cancel()
>>
> 
> From what I see, I don't think it's safe to call the abort in
> fuse_uring_cancel() since the cancel runs in the io_uring submitter's
> task context and the uring lock is held when it gets called. The abort
> logic can trigger calls to io_uring_cmd_done(cmd, -ENOTCONN,
> IO_URING_F_UNLOCKED) (through fuse_uring_stop_queues() ->
> fuse_uring_entry_teardown()) which will lead to a deadlock in trying
> to acquire the lock that's already held. I like the idea of keeping
> things simple with just aborting, but I think in actuality it might
> lead to more trouble.
> 

Yeah agreed, this lock is a persistent root of trouble :) I'm still
tempted to create an async task to tear down the connection here.


Thanks,
Bernd
