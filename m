Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2918627AC31
	for <fuse-devel@lists.linux.dev>; Mon, 24 Aug 2026 07:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558400; cv=none; b=SmXOVfANd/ZR4rdrfUdJLIk45KOAxTZcxDB0Y2RTsIVWfoH/wLVacd1+eis/LXoHWJPOFEylMdZr4l3Op1sOVi0r8j+JiL0ytZbmFqKiiRWtD1sa5XGd7smJ0zedhMuKICkmyeAeykFiGw7lMQXaKoZoWpm/XT2gZe4IrGzz+vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558400; c=relaxed/simple;
	bh=eZpQ0TZ4cH4ak8aYBG05InfCfhzvlFPRWZB982fA9/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txBXYPD9SY/YHo+GtftKx7LEBjEwXtFABniv08e2pXMKNmvFvZ+XNXmrAam2FVrhMt+mh447+yDZdKvsM0Bik/ECE4uJXnh6/GgdW0+K2icVfIbrBdTwXvGwbyUi36UTWt12ER+J2vGeBVe0p8OqH45VwcOI+yEaUJLVLWKMEeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=l3/hi+bF; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="l3/hi+bF"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787558390; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=eZpQ0TZ4cH4ak8aYBG05InfCfhzvlFPRWZB982fA9/g=;
	b=l3/hi+bFynKOuYqsVH+7DlNqdh9ntiDg+VNx2D3X+FOAA3ks8CucPsGkUc1oRxxr5SA/HMGa1h6d9RZMmIeQR11MZXid3ZDRHygTkWzJlHaX9i8ZkerH0+rvI+rdS1fpr/e/GG9OH8Cx+HICCj/8vnnpdLFzKYK2kUFM96HjkG0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X9VKbr4_1787558389;
Received: from 30.221.131.155(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X9VKbr4_1787558389 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 24 Aug 2026 15:59:49 +0800
Message-ID: <ba933500-eab4-4ee5-b276-2e155cd992ba@linux.alibaba.com>
Date: Mon, 24 Aug 2026 15:59:48 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fuse: Fix the condition to enable over-io-uring
To: bernd@bsbernd.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong
 <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev,
 Thomas <thomas.fractalbits@gmail.com>, zhu <zzsheng@gmail.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, stable@kernel.org
References: <20260821-fuse-fix-enable-condition-v2-1-35a386d3d443@bsbernd.com>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <20260821-fuse-fix-enable-condition-v2-1-35a386d3d443@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bernd,

On 2026/8/22 00:19, Bernd Schubert via B4 Relay wrote:
> + /* Once a connection has io-uring enabled on it, it can't be disabled */
> + if (!enable_uring && !fch->io_uring) {
> + pr_info_ratelimited("fuse-io-uring is disabled by module parameter\n");
> + return -EOPNOTSUPP;
> + }
> +
> + if (!fch->io_uring) {
> + pr_info_ratelimited(
> + "fuse-io-uring not enabled on this connection\n");
> + return -EOPNOTSUPP;
> + }

This combined with the REGISTER error path can hang IO when the ring is
already operational.  E.g. 100 entries, the 100th REGISTER fails after
ring->ready is set:

  new request:                        server fetch:
  fuse_send_one()                     IORING_OP_URING_CMD
    fiq->ops->send_req()                fuse_uring_cmd()
      fuse_uring_queue_fuse_req()         if (!fch->io_uring)  // == 0
        -> queued, no consumer              return -EOPNOTSUPP

The error path clears fch->io_uring but never reverts fiq->ops, so
requests keep flowing into io_uring queues while COMMIT_AND_FETCH is
rejected for all 99 active entries.

Maybe only tear down if the ring never became ready:

      if (err) {
          if (!fuse_uring_ready(fch)) {
              fch->io_uring = 0;
              wake_up_all(&fch->blocked_waitq);
              pr_info("[%u] fuse-io-uring disabled on connection err=%d\n",
                      fch->conn->dev, err);
          }
          return err;
      }


Regards,
Baokun


