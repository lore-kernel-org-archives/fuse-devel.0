Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC59D2DA74C
	for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 12:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143256; cv=pass; b=LbOwYud635ZkiULT1dka6bTcNzG+eNMCwnSTvq7YpMSPcpK3i7+dMpA0QnZlAy1GGvZoJ0vsl/1M8WVUeUG2DU7klZiERMet+DJgc3VpnQnd3F6gd7pDSbKFDFfB90YPom6UbN4DnEJ2VTY7hbxdZLK7A4rLE+TC55drF5j2C1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143256; c=relaxed/simple;
	bh=FMMCeXsWewqCqSlwRq7fpQsvaPxdERiuzxMm3uJ8O5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYgoVlzXbg92J+FP2qz8XvU7BPf/kSDe6H71Y1xzUjEac7PYVAZzya2IL/Q4Vtuo/knpZ4UP2TGSrNO+3pRE/RmpCi0Ce+RvUuEvLYQY1rZYjQg4IGQub+K7yHflxorlwQty7cZPh7jY1bXBd3skeRDfJ9YXZK5DpwPww59gla4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=XcwozmMA; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="XcwozmMA"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c1372f84dso6195811cf.2
        for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 05:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787143254; cv=none;
        d=google.com; s=arc-20260327;
        b=oiRPhiR5MStirus0B9bTksmOQ1CNRZoejr9pXlGUXIDs1SzaC9tSab8Vtq98rBo2T1
         KwlH+SUYXk27XxwKzqpjMESx4ni4bgZFvfDqcf4SCB4nRW8863vEdR0oh+aSwZ5kVtPv
         i1OnaxOAZiqIcJjks0QlLAlbgwRGteR29TheDN49mMecbG6YNYfI3NTtXLDzRW/gp7qe
         6zKlNe2XK7mxL6cq4kTR6/0fZvf2ZdYzt4tXQHl496N89Lc2Y3ZfpKBC34iw4UKEZaAh
         w6wzbB+ZLeL8uM1TcD7+RE6Jf1MtfYLjGE1iBI9ec/K1Wg8I8XklU2a0QizZsDTIEuIR
         uwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FMMCeXsWewqCqSlwRq7fpQsvaPxdERiuzxMm3uJ8O5Q=;
        fh=DX6o5ywIz8ArOqefdzHwxQrEGkybEbQyWDh2plXPy5A=;
        b=CyddOVGDLMcdJxiTRu0yXRWQZDHcCK8XyfkOHClu5Y/CMPwk8eRzZGzmrA302o/513
         3CVcpRKTWCzOrfFnSqrN9DAGh42anJlkqiJ+GEYrPnlw+xS5TGGK5/iUfp56AHDC6hkv
         Ms2qO9de7A8k4EauZ4B51aIsr6sxX8e6wu4DdP+yE7wYJzt88H0oRJLdDxT48KLGIENC
         U8ljiPIhqMVjh34ejKDWJ9zp02pJvSiNl9uCaBy2MUKwSsfrHuYUvIOrESPeIj29+6XS
         IERREsOo7rVD7+sMkDH9ChesJ4DXuZvryoXlsTJ/SE8Hag3GmGZ4HYMyx5sqMiOMM0Qv
         UuTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787143254; x=1787748054; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMMCeXsWewqCqSlwRq7fpQsvaPxdERiuzxMm3uJ8O5Q=;
        b=XcwozmMAMYDdwV+ve2voDugRKbPxDsIsgPmjt5bKOuv2DgN/9i4qHLnVe/6uQrf5CD
         8ppnRPWvcYa2nz1D3q6AnPPC2sNuJ5PX5JGJxYZTgfcg0/ykeMAbhJa9auVL6YS3dltM
         LJrLnlVm774gg6sk2k+YuNabFWbYxzcMS/HEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143254; x=1787748054;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FMMCeXsWewqCqSlwRq7fpQsvaPxdERiuzxMm3uJ8O5Q=;
        b=CCVqnqKDF2cNdQCgqG7G+qglB5nDmhQ3HQpQ7YswZRRJbhB3XjDH5MeYrPC4M01qQj
         o6Wt2kqEmg24iF7k+VgzP4mirop0z6RunUcVzuRTzjTZHz7s3wVege/ee5/P9Oc26+Xq
         PVIZnvU6xOJY30mLRsiBaaaae8c3ZiRfUkjGC68JmfCqqgQS3HPcsM/QyPGwV9BIAZab
         vJKmhVsjU0/EIvyRW5QsxerWGltHW/4cDntZi7Nrpg9WqHFqgaVHoDaXWYUQvsfbRaMT
         TtPsOzS4YbI8iVluyyX9rLK6S083b9nXIoEO35+QQGp7/KU8602VZ2MDC14GgiGUGZp+
         vUIQ==
X-Gm-Message-State: AOJu0YwjZtsGXOT5BFh5h/GQb5EGTV+4Ai6W1imhBn/LbCoNGx7GjcQa
	KzdjrR0R1+d7sT6HZKEWg4ydOKWNzD56LFtnaPKlFkvVe2OSswUCGQlEdVG7TQfGM1+yLMUiWDb
	mKXyIWTlCQcovXW/xrVmrj6ilrRJrxQFIW8U8V5D6RQ==
X-Gm-Gg: AR+sD10DojKCjTME4CeXDdPP50WgW0qUd4wR+7KgPvCd+WqPH01pUh6zfzLoh32sY8g
	EhrpQEvc5+NsJXd1B4ELTtJ5V7GXWIf+lsAMm49FR1V6PvmE/mJxtNu8V01vmnEB/EZCeSaiqOW
	XqfJ7j/G3RZF9/pCvuv2UrEIWpQFdUAEtZbjXsDVnrKVfh/f9T7OE7z7FHXu0th6LHWw78Pagyc
	TonrKzAtTifOfz9y6RLaoE0jD91Gix7GeP3FLfZkY2CxPSfGCXk7yoClC2jRpQVyHOcVn/OrCFL
	PcF1szmzB4SbxxjH8uv2Gf7PhHrRcA80AYx7Q53v6QauEWsG2TBARs2bbCV1OclupORdHIj4a2r
	621BJ3Jb3maM=
X-Received: by 2002:a05:622a:1b23:b0:52b:4f1a:5ff0 with SMTP id
 d75a77b69052e-52dd5a30b5bmr38809341cf.19.1787143253813; Wed, 19 Aug 2026
 05:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819090728.3331501-1-libaokun@linux.alibaba.com>
In-Reply-To: <20260819090728.3331501-1-libaokun@linux.alibaba.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 19 Aug 2026 14:40:41 +0200
X-Gm-Features: AcwNN1XgdaxcmflefGTSqkwgePG2e0069kE1y5nYemadtLfFV87ZKHogKFdV5KU
Message-ID: <CAJfpegvDNTf27Fcgxc5wydQ5SQ1EKZeaUadx11MZMYP6m+TbQg@mail.gmail.com>
Subject: Re: [PATCH] fuse: invalidate the correct range after O_APPEND direct write
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cding@ddn.com, jefflexu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 11:07, Baokun Li <libaokun@linux.alibaba.com> wrote:

> Fix by reading pos back from iocb->ki_pos after generic_write_checks(),
> as generic_file_direct_write() does.
>
> Also fix a typo in the comment ("may have" -> "may have competed").
>
> Fixes: 2b0408d0284f ("fuse: invalidate page cache after DIO and async DIO writes")
> Signed-off-by: Baokun Li <libaokun@linux.alibaba.com>

Applied, thanks.

Miklos
