Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE44440A35
	for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 12:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661341; cv=pass; b=iS4C/d0EAaqoLc04+eayjF7A9LDpU/H9cgHDim6AJdV5Fo7DiuIZI53hzCupLFF7DPqr8xOw1HifYHN5X3/BQzb5ccYZziT3AZozQLpec+qIiSZpU+uDaQrh5Fuz7QU+XycdmLx9WT6GeX3Z5DScD7bp6yjMHe/AoBr8MjQEEuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661341; c=relaxed/simple;
	bh=7g7stKk6REmQErv6V40bHNhCn0PQgySqOyemIbVP6Eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBds8GSMHtnnDxx53E22NOk0JB40D5rdrFQ8zb0gcZanBL3sKvk7j3/6TGf1c3bDiowLe3gc774zyvgzKiP9JBEiOBgkFH5JhkttFMRGopOffQV72mZLK5TXZMLEYNsGFt1TqU9IgRo6W+4uVLnCR0msznUsugbYeSXVQUuOhiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=CEkgrmjl; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="CEkgrmjl"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-529a1ee0e62so29816391cf.2
        for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 05:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787661324; cv=none;
        d=google.com; s=arc-20260327;
        b=m30J8TzgumLmQiGX9tCVaC++x4nlqlNMnL8rcj8tfBWTvzUg6z7XoGmB8Lgq34veB4
         bMOBGhO9QuuD19HM8f32cAaC97zmOTndPDBKQB5tW9C8BoLqB1zZTI3pGRJtz30r6Zk2
         VFbN9CdNx41TcuY1Abz8P1JQbMfYIBL3BxdYulDrNfBdvE7hgvb0GkqDiO1lD7ebIqD+
         REs52e1kxQ83PHLGJ2vBbdta24c32qDe0tjzB4hXyF5arm2nP8lPKWD+Jp2l88VN9U4O
         cmdVv2nmPFfS+pkXZ3ErD3jXkYOBAX+DuYsizHaChJeTMdnpzKVitMREmJsgpa+2BtXx
         JI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7g7stKk6REmQErv6V40bHNhCn0PQgySqOyemIbVP6Eg=;
        fh=VmofVl0u9vih9bQxmL88cA7rHGQx6rPDmlrrsijJodI=;
        b=IPLhtAMkipUUw+ygky7htA8BxMd+Brj0ez1NidaV+76l1yi5fPwazBNNzdh5iDuWnj
         WNV/5N12z5w2//P2m0wCJTn5jbOoxesfy7VHW4QDZQnKuucvT8CHuGx+ekf3xRoia9PX
         42+58ZE+GFROStjS8kGteFtrxVBC8OZRACBT7iDAlPOZSOiGbvsyLw/xbBQjySlVADrD
         TEDl8LSMb9w7mHg0Qt5SJaxQ+JUjmK8aB2Aag4OIS11XMwpwcLJgFWQwzOED0bwSRgvM
         J6tJp8kUQlzbp8cVlvP7c1YknLT9U9N2TXkQGh0988pR+PxLWBNMXN8wGcELBKQViNFd
         uptg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787661324; x=1788266124; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7g7stKk6REmQErv6V40bHNhCn0PQgySqOyemIbVP6Eg=;
        b=CEkgrmjlqBGofD04KRQLjGAmoeFlYjZYrEXJpVWW6oMBUpLnc74IU2O1P1WbMYNkPr
         uichTzPNdNqrFspy/fDaosilOk6/+V9lfatTm3Q0fHW8rXoPe2Lgk0rZjo61sQio2fiq
         ARiP724ZXs7IOfo++lOJlseEwtNCLqGbuJiSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661324; x=1788266124;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7g7stKk6REmQErv6V40bHNhCn0PQgySqOyemIbVP6Eg=;
        b=GQravXy8AB8BkWsGI/YKyenG4tQ3clQZp4gXNwI3a7WZaMWboOZ2X6JoY6I+vrR08o
         2jujPbr4jC/zhfmQmnqSSgd67QOLzirjLu7vhoRzEw9BpK4IECmqMh+fwWIiBGKYfkvW
         gYGroM0Q/bdzJZ+ZF+voKJJNLHvLPcYIbpp56oB0an+2E9Uhd0L8YhRoQVMh/su2of+B
         l3I4OJt++hBvO6+v+VRqdk7Wsb0z2j2oFQPXtRrvahAOWNyGKT+29iXVGf6mQKch0s2U
         CK1puw/7hi5xQ46JpktU8NoXIZrzC08+VCXH5h+t94yBIStTqzvei7BLIKsFx7mkHnC2
         5r+Q==
X-Gm-Message-State: AFuF++mwi4aHG/+bYAjyO4ml9JNsmN43j6fzweETeooZ2R8Fcg9Kv8ME
	DRdx4312OtriI2eZOUzO0BJIVHVr5iuHUrLiAh9SiqqZL4VKsLcu41huaNNwBnCwSdntfdUP19Y
	49EZ55I+i4gEPRj/I3hvSnFAYTt83sPMj02yPueKBmw==
X-Gm-Gg: AR+sD12d1yihYi+lvIOz0zijcBKJJ0tdWZ4Gt8X1rXUWTAUPL0Ffi5RhI1oB8mvYfKl
	hg8Ql63BrecHqyJTJJkedTbeNepS/Z8Vhf8MqB3vw4dYFSAWsBStk7KNia4HBTjwAws8uRttTKx
	of29+izzxlBID1IK197tNOoI8tWQBeEiyT5lkqMBsndEEbcycr3iTN8+xxGr5tEY1Aj7wZVrVmF
	ltiJam6QTsggm0O/V0bflnwjNgl8ynyMidq1+OqcUIQyhE7lBcuzkXEkQ1O/26raXVgXJlb5NRX
	HUZfOQLsxj+YvlTaWdwjOeTUDq1FLYSVcFcwy2mJbSoR47Mxv8QW1yTKiXbsxH5KjbHKCh1oE3m
	7xww=
X-Received: by 2002:a05:622a:c8:b0:51c:1e46:711a with SMTP id
 d75a77b69052e-52df5a32204mr337490331cf.24.1787661323978; Tue, 25 Aug 2026
 05:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818161448.51495-1-A.Nasrolahi01@gmail.com>
In-Reply-To: <20260818161448.51495-1-A.Nasrolahi01@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 25 Aug 2026 14:35:12 +0200
X-Gm-Features: AcwNN1XVQ5iDUb93MSTQ6LQHhP_01F8lTRYM36_bUxZpvtKpcJf_EI08F6hyfkg
Message-ID: <CAJfpegsp7A7w6dLtDWLZgCNVbnXSG0FvYFxX3e-Djur9=hgY-w@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: ioctl: remove unnecessary comparison in fuse_setup_measure_verity()
To: Ali Nasrollahi <a.nasrolahi01@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Aug 2026 at 18:15, Ali Nasrollahi <a.nasrolahi01@gmail.com> wrote:

> The comparison is between the 16-bit digest_size and a size_t-sized
> constant. Since this comparison cannot be true, remove it.
>
> Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>

Applied, thanks.

Miklos
