Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A712517AC
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 16:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935347; cv=none; b=AWHTr9xYq2MTlkeBinUeAzVTaSyqF5fJ7wxDvBDZKaOVVMfwIHwaOGnOYdVNFbSfj2w6CrRraLfd7hh8GRGD4r7htLD/MPlqgZBcBO/E3ccm516NXTCeMx3gN64TJkdZ3AXNMjKKkQDasZBBHLM3xI7BqS0LmsYgIJbIlfk302o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935347; c=relaxed/simple;
	bh=EbqFtN4eSykO0BJBw8H4JML1RbnlIYIUca2wLZLqVpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c6dQ19SCUEJwxneTm3zjEpooiArGs7QeN94uphPW3KtCEIDQOZWJ0EwmEBr540oXD2dO7aM8Lf5K4+To5ZHAPSFxUp9T3c0OTnmYIlZezthYpKeje4ukxY9jcFWp28ZYZt+ARzUW3/UyMgvDB2d2kwckqAJTtVgRh5v3TMD2lE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=U2L+ZsBP; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="U2L+ZsBP"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780935340; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=umJSpwxZ1jp0Fo80mrH6SxOYuJ+r6wQnBy+yq8OfUig=;
	b=U2L+ZsBPAn3pVl4P35kSUwHa3Y84RfEMSgjUiBucqN1dof3yA8ugh2Cy1CPt0eP3Tre/2ku6tubpmocqK6+CxGIbq97Drj3LiUbp25+CsqeX7bYW3DPtX3USebm2FVz3C3jbs4d57Udp8XB7rEree/oNH1Bzzz3FSxoC0X2+Z7w=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X4S9YFE_1780935338;
Received: from 30.170.105.22(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X4S9YFE_1780935338 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 09 Jun 2026 00:15:39 +0800
Message-ID: <62fc2403-4245-46ee-83e2-a8779d8b5280@linux.alibaba.com>
Date: Tue, 9 Jun 2026 00:15:37 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] fuse: add zero-copy over io-uring
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, bernd@bsbernd.com, jlayton@kernel.org,
 axboe@kernel.dk, fuse-devel@lists.linux.dev
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <20260522205823.1597313-10-joannelkoong@gmail.com>
 <d1d588e9-5d4b-4e3f-8154-e769e9e69f12@linux.alibaba.com>
 <CAJnrk1bSr7B3kp3x8RdZWM+6F6H2h7r-pJhvqxoFpxaOtjF2mQ@mail.gmail.com>
 <CAJnrk1Y5AMZYz8cy9RJHFzYTK=H0we0b9uJiCHQz5EcZaMZzqg@mail.gmail.com>
 <6ae8fcca-2a48-4555-98cc-930c0dd3589a@linux.alibaba.com>
 <CAJnrk1ZgaKRhUg2Pwaqe3GD0-BXQWPR9iHzzSPgg3ygfby8gmA@mail.gmail.com>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <CAJnrk1ZgaKRhUg2Pwaqe3GD0-BXQWPR9iHzzSPgg3ygfby8gmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026/6/8 23:59, Joanne Koong wrote:
> On Mon, Jun 8, 2026 at 5:14 AM Baokun Li <libaokun@linux.alibaba.com> wrote:
>> On 2026/6/5 05:42, Joanne Koong wrote:
>>>>> Hi Joanne,
>>>>>
>>>>> If a connection abort happens while a zero-copy request is in-flight,
>>>>> io_buffer_unregister() is never called. The buf_table slot remains
>>>>> occupied and folios stay pinned until the io_uring ring is destroyed.
>>>>>
>>>>> So perhaps we need to add the corresponding cleanup in
>>>>> fuse_uring_entry_teardown(). Otherwise looks good to me:
>>>>>
>>>>> Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
>>>> Hi Baokun,
>>>>
>>>> Thanks for reviewing this series.  That's a good point - the io buffer
>>>> is unregistered in fuse_uring_req_end() when a request is ended, but
>>>> the abort code calls fuse_uring_stop_fuse_req_end(), not
>>>> fuse_uring_req_end(). I'll add this in.
>>> Revisiting this... I had this cleanup in the series I sent out last
>>> December [1] but in order to accommodate unregistration on teardown
>>> during the abort race, it requires nontrivial changes to io-uring, as
>>> it requires operating on a ring ctx handle but it's tricky to
>>> ascertain if the handle is valid or not. I had discussed it with Jens
>>> at LPC last year, and we came to the conclusion that it's not worth
>>> introducing the complexity to accommodate this specific scenario and
>>> it's fine to leave the buffer table slot occupied with pinned folios
>>> until the io-uring ring is destroyed.
>> Hi Joanne,
>>
>> Thanks for explaining the background.
>>
>> I think we can handle this with a simple change in
>> fuse_uring_entry_teardown(), without any io-uring side modifications:
>>
>> --- a/fs/fuse/dev_uring.c
>> +++ b/fs/fuse/dev_uring.c
>> @@ -514,8 +514,14 @@ static void fuse_uring_entry_teardown(struct
>> fuse_ring_ent *ent)
>>         ent->state = FRRS_RELEASED;
>>         spin_unlock(&queue->lock);
>>
>> -       if (cmd)
>> +       if (cmd) {
>> +               if (ent->zero_copied) {
>> +                       io_buffer_unregister(cmd, ent->zero_copy_index,
>> +                                            IO_URING_F_UNLOCKED);
>> +                       ent->zero_copied = false;
> Hi Baokun,
>
> Unfortunately, I don't think this fires. For ents in userspace, there
> is no cmd associated with the ent. cmds are only valid for an ent when
> the kernel hasn't yet "returned" the cmd to userspace (this is
> enforced in fuse_uring_send() where ent->cmd gets set to NULL). For
> the scenario you're describing (a zero-copy request in-flight in
> userspace when the abort hits), the ent is in FRRS_USERSPACE with
> ent->cmd == NULL, which means the if (cmd) guard above will skip this
> logic.
>
>
Hi Joanne,

You're right, I missed that. fuse_uring_send() completes the cmd
and sets ent->cmd = NULL before the entry enters FRRS_USERSPACE.
So when abort hits a zero-copied entry, cmd is already gone — the
if (cmd) guard skips the unregister entirely.

The timeline is:

  1. Request dispatched → io_buffer_register_bvec(), zero_copied = true
  2. fuse_uring_send() → ent->cmd = NULL, io_uring_cmd_done()
  3. Server doing zero-copy IO, ent in FRRS_USERSPACE, no cmd
  4. umount -f → teardown → cmd == NULL → unregister never fires

I now understand the problem you described — to unregister without
cmd, we'd need an independent handle to the ring ctx, and ensuring
its validity is where the complexity lies. I agree that it's not
worth introducing that complexity for this scenario, and leaving the
buffer table slot occupied until the ring is destroyed is a
reasonable tradeoff.

Thanks for taking the time to walk me through this.


Thanks,
Baokun

