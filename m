Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1001D2C032E
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 03:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556062; cv=none; b=azwld46xazRP6Rc0BRTHCMLGt3zDeSWiZuzniRsMEyenfok88Mqz9nea9yFZ+D/XcHFPkrSBIRc7YNaV7jBJv/BsLLK9yxTCU4WLld0zrFMgJM0ICFiCVsbseFtK/fnen6Emf5yLZ1XHxZk2HHDUb94MYFIsZQVQ2/B+HL34WRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556062; c=relaxed/simple;
	bh=k/cAOhpPlqvufmnklM+KHKctuEDdqTKxL7i2oZTqJ+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lP8flTLsxoFlKQwXg7llbcatKvrx8jJaWhqaaA4SAQew/Esti+Q4rBA2BiguCtitJiahSrEcohAaNf0FdSQX9qyHRW9SJL/X7+mzmOk91kvCeU8LC4kQcHuNaOnDtAR7u3MsGQQ7cZvaUKAcaKoxFSWIR7PWgvHKBnc0IbaaE8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=S8fC3wx0; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="S8fC3wx0"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778556057; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=4mfmPrdBpTvSAd0Hnrk+UIfd5snn6fbcRe7Twpxfdrs=;
	b=S8fC3wx0KRcDwep/VpMJW+GF5EHADobWIqjtwpPjmzru810aAs+NFkn6617ew8R8EtBifpLw9wIaNQh7fWVM6rHoueDg8ctBXA1DWO0vogP9LEXtOsYeeG8rSmAvnXwA3l0/RXkUPDhQmxLhArXmciXTYD4hlKM/n2msquWEp2g=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R801e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X2p00W._1778556053;
Received: from 30.221.130.241(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0X2p00W._1778556053 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 12 May 2026 11:20:54 +0800
Message-ID: <943cb464-78f3-44a7-92a7-57a1fe4fbc10@linux.alibaba.com>
Date: Tue, 12 May 2026 11:20:53 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [post LSFMM summary] where is fuse going?
To: Amir Goldstein <amir73il@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel <fuse-devel@lists.linux.dev>, linux-fsdevel@vger.kernel.org,
 John Groves <John@groves.net>, Joanne Koong <joannelkoong@gmail.com>,
 "Darrick J . Wong" <djwong@kernel.org>, Bernd Schubert <bernd@bsbernd.com>,
 Horst Birthelmer <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
References: <CAJfpegvXnA1QpmfM9V+3VB470xYDNWH8FV0mBV1R1-HqvjfJ8A@mail.gmail.com>
 <CAOQ4uxhnOEkX4qnn0wHMCqWhEeAGTR9rxcw5u_oqGUovuszo0w@mail.gmail.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <CAOQ4uxhnOEkX4qnn0wHMCqWhEeAGTR9rxcw5u_oqGUovuszo0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/5/12 01:18, Amir Goldstein wrote:
> On Mon, May 11, 2026 at 5:12 PM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>
>> Please let know what I missed.
>>
>> CO-MAINTAINER:  Position still open, though we formalized some
>> subsystem maintainership roles, sent MAINTAINERS patch.
>>
>> FAMFS: Let's try to find some common ground between the fuse-iomap api
>> and the famfs api.  I.e. add striping as a generic mapping method,
>> even though normal filesystems don't (currently) use it.  Using BPF is
>> a bad idea.
> 
> IMO, FAMFS sits somewhere between PASSTHROUGH and IOMAP.
> The simple nature of the maps, the fact that famfs maps are const and
> queried at file open time makes me think that famfs is much closer to
> PASSTHROUGH than it is to IOMAP (in its full capacity).
> 
> I think Joanne has mentioned that her customers have a use case for
> multi backing ids per passthrough file and I assume this would be a pretty
> simple map, so that sounds pretty darn close to famfs already.

I vaguely remembered that Joanne mentioned that mapping multiple
backing files into one FUSE inode at the end of session.

Is that the case you mentioned here? The requirement _might_ be
reasonable, but how does the entire page cache work for such cases?
Each vma can only point to exact one single real vm_file and rmap
totally relies on it.

Unless there are some more non-trivial core-MM enhancement (e.g. to
split into several vmas for each range), I don't think it's possible
for the current page cache infra. For DAX, it might be possible
since DAX has a seperate workflow.

Thanks,
Gao Xiang
