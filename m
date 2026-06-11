Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57C5238D52
	for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 16:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196997; cv=none; b=Fj2zIBdPwrCI9zq/rP62uX1TDlQ6cx9V9kUtAJTsiDwSN1S7yPBPy1PJqgVVQannhMJEODelrdte6qYpcHpKrVbZOzpxfZkILNf/G7jqefNDeA3C5A/9r8M/M5xp/DxnV48smBvJJnNkCtwrISDnbXILxNeW+jd02LBBCH4jZrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196997; c=relaxed/simple;
	bh=qf4tF6DDQoc+VeqxB85st5yzJGY/rpLSfjtDDWcUkT8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d42R9u3SwFqPyxL/3o9bIONiHBE3l8CkupDYGTDDrw2jM2DtzvBPgWh/ZUMUyNc4qq+Osekz+1biGc6D57in6thWdOYHSPd/TvJ635AnowVDe+V3jbUL6RpKQanID8gSseplpqrCKMO9xP7yL9bwzXBOoUJLf6shT2aCeWIwwNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Dsc00q8d; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Dsc00q8d"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781196992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qf4tF6DDQoc+VeqxB85st5yzJGY/rpLSfjtDDWcUkT8=;
	b=Dsc00q8dBhjQ7P63hMVhQ2G8tAow+7eH6wysK+sE7aEJbaNvLqxFSiVSk1JeEXuB8tpOJx
	ruHJsXcRR1klAmpGb45kfJzhARQEbZUkyb3B4dl4EAlTwhxnFG/dmbTsTs4x8kci4RF3NT
	hJeWSgWjLeVGuKije0KleP0CC8gJW1k=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel <fuse-devel@lists.linux.dev>
Subject: Re: sashiko review on fuse-devel
In-Reply-To: <CAJfpeguQ-_P2LUaVCics6Pyba+bde-KJYJ=Ori7Oqyv0V3O9fg@mail.gmail.com>
	(Miklos Szeredi's message of "Thu, 11 Jun 2026 09:06:35 +0200")
References: <CAJfpeguQ-_P2LUaVCics6Pyba+bde-KJYJ=Ori7Oqyv0V3O9fg@mail.gmail.com>
Date: Thu, 11 Jun 2026 16:56:16 +0000
Message-ID: <7ia4bjdhnhhr.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Miklos Szeredi <miklos@szeredi.hu> writes:

> Hi Roman,

Hi Miklos,

> Could you please add <fuse-devel@lists.linux.dev> to sashiko?

Sure. If you also want email reviews, please, take a look at
https://github.com/sashiko-dev/sashiko/blob/main/MAINTAINERS_GUIDE.md

Thanks!
